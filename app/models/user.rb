class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :submit
  has_many :badges


  before_create :create_directory
  after_create :create_badges

  private
    # Badge create
    def create_badges
      Exercise.all.each do |exercise|
        badge = Badge.new
        badge.exercise = exercise
        badge.user = self
        badge.save
      end
    end

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
