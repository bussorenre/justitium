class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :submit


  before_create :create_directory

  private
    # file upload
    def create_directory
      Dir.mkdir(full_path)
      Dir.chdir(full_path) do
        spawn("git init")
        File.open(".gitignore", "w") do |file|
          file.puts "exe_*"
          file.puts "output.txt"
          file.close
        end
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
      return Rails.root.join('public/submits/').to_s + self.email + "/"
    end


end
