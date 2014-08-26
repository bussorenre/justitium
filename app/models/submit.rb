require 'fileutils'

class Submit < ActiveRecord::Base
  attr_accessor :file

  belongs_to :user
  belongs_to :exercise

  before_create :store_file
  before_destroy :destroy_file

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
        File.unlink full_path
      rescue
        nil
      end
    end

    def full_path
      return Rails.root.join('public/submits/').to_s + self.user.email + "/" + "test.m"
    end

end
