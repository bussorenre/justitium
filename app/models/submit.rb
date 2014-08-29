require 'fileutils'
require 'systemu'

class Submit < ActiveRecord::Base
  attr_accessor :file
  include ActiveModel::Validations
  validate :check_file

  validates :exercise_id, presence: true

  belongs_to :user
  belongs_to :exercise

  before_create :store_file
  before_destroy :destroy_file
  after_create :judge_file

  # default scope
  default_scope { order('created_at DESC') }

  private
    def check_file
      if file == nil
        errors.add(:file, "must be not empty")
        return false
      end
      errors.add(:file, "too large file size") if file.size > 1024*1024
      errors.add(:file, "upload file must be '.c' ") if File.extname(file.original_filename) != ".c"
      return false if errors.messages
    end

    # file upload
    def store_file
      dirname = File.dirname(full_path)
      unless File.directory?(dirname)
        FileUtils.mkdir_p(dirname)
      end
      File.open(full_path, "wb") do |f|
        f.write self.content
      end
    end

    def destroy_file
      begin
        # File.unlink full_path

      rescue
        nil
      end
    end

    def full_path
      return Rails.root.join('public/submits/').to_s + self.user.email + "/" + self.exercise.unique_name + ".c"
    end


    def target_path
      return Rails.root.join('public/exercises/').to_s + self.exercise.unique_name
    end

    # judge files
    def judge_file
      dir = File.dirname(full_path)
      t = File.basename(full_path, ".c")
      Dir.chdir(dir) do

        # git の実行
        spawn("git add .")
        spawn("git commit -m \"modified #{t}.c\"")

        # gcc の実行
        looper = "gcc -o exe_#{t} #{t}.c"
        status, stdout, stderr = systemu looper
        if status.exitstatus.to_i != 0
          self.result = "Compile Error"
          self.save
          return false
        end

        # 解答のチェック
        Dir.glob(target_path + "/input/*").each do |input_path|
          output_path = input_path.gsub(/input/, 'output')
          tmp = File.join(dir, "output.txt") 
          puts "Log - #{input_path}"

          # 実際に実行してみる。
          status, stdout, stderr = systemu "./exe_#{t} < #{input_path} > #{tmp}" do |cid|
            begin
              Timeout::timeout(3) do
                # sleep 3
              end
            rescue Timeout::Error
              Process.kill 9, cid
            end
          end

          # diff を取ってエラーかどうかを確認する
          status, stdout, stderr = systemu "diff #{output_path} #{tmp}"
          if status.exitstatus.to_i != 0
            self.result = "Wrong Answer"
            self.save
            return false
          end
          self.result = "Success!"
          self.save
        end

      end
    end
end

