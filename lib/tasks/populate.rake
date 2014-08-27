require 'securerandom'

namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    
    # 全て削除を行う
    [User, Exercise, Submit].each(&:delete_all)

    # submits ディレクトリの削除を行う
    spawn("rm -rf #{Rails.root.join("public","submits", "*")}")
    
    # open CSV files
    file = File::open(Rails.root.join("log","populate.csv"), "w")

    # Create Experiment Users
    5.times do |i|
      user = User.new
      user.email = "de%04d@experiment.edu" % [i+1]
      user.password = SecureRandom.hex[0..8]
      user.password_confirmation = user.password
      file.puts "#{user.email}, #{user.password}"
      user.save
    end
    file.close

    # Create Exercise models
    Dir.glob(Rails.root.join('public/exercises/*/*.md')).each do |exercise_path|
      exf = File.basename(exercise_path, ".md")
      exercise = Exercise.new
      exercise.unique_name = exf
      exercise.content_body = open(exercise_path, "r").read
      exercise.save
    end
    

  end
end