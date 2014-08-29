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

    # Create Admin User
    1.times do 
      user = User.new
      user.email = "bussorenre0088@gmail.com"
      user.password = "password"
      user.password_confirmation = user.password
      user.save
    end

    # Create Experiment Users
    5.times do |i|
      user = User.new
      user.email = "de%03d@exp.edu" % [i+1]
      user.password = SecureRandom.hex[0..8]
      user.password_confirmation = user.password
      file.puts "#{user.email}, #{user.password}"
      user.save
    end
    file.close

    # Exercise titles
    titles = {
      'quiz1' => 'Add number',
      'quiz2' => 'FizzBuzz',
      'quiz4' => 'Leap Year',
      'quiz5' => 'Inner Product',
      'quiz6' => 'Palindrome',
      'quiz7' => 'Sorting',
      'quiz8' => 'Combination nCr',
      'quiz9' => 'find a phrase "the"'
    }


    # Create Exercise models
    Dir.glob(Rails.root.join('public/exercises/*/*.md')).each do |exercise_path|
      exf = File.basename(exercise_path, ".md")
      exercise = Exercise.new
      exercise.unique_name = exf
      exercise.title = titles[exercise.unique_name]
      exercise.content_body = open(exercise_path, "r").read
      exercise.save
    end
    

  end
end