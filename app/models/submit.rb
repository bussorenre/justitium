require 'fileutils'

class Submit < ActiveRecord::Base
  attr_accessor :file

  validates :exercise_id, presence: true

  belongs_to :user
  belongs_to :exercise

  before_create :store_file
  before_destroy :destroy_file
  after_create :judge_file

  private
    # file upload
    def store_file
      dirname = File.dirname(full_path)
      unless File.directory?(dirname)
        FileUtils.mkdir_p(dirname)
      end
      File.open(full_path, "wb") do |f|
        f.write self.file.read
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

    # judge files
    def judge_file
      dir = File.dirname(full_path)
      t = File.basename(full_path, ".c")
      Dir.chdir(dir) do
        puts "Log - #{dir}"
        IO.popen("gcc -o exe_#{t} #{t}.c") do |msg|
          if $?.to_i != 0
            self.result = "Compile Error"
            self.save
            return false
          end
          self.result = "Success"
          self.save
        end

      end
    end
end

