namespace :demo do
  desc 'Set the fake data for the demo user'
  task :populate => :environment do

    user = User.find_or_create_by(email: "demo@cravin.gs") do |user|
      user.password = Devise.friendly_token[0,20]
    end
    (0..30).each do |i|
      Quantum.leap(Time.now - i.days) do
        user.meals.create(choice: Choice.all.sample, occasion: ['breakfasr, lunch, dinner'].sample)
      end
    end
    
  end
end
