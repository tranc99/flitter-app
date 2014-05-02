namespace :db do
    desc "Fill database with sample data"
    task populate: :environment do
	admin = User.create!(name: "Example User",
			     email: "example@railstutorial.org",
			     password: "foobar",
			     password_confirmation: "foobar",
			     admin: true)
	ten = User.create!(name: "Ten Mutunhire",
			   email: "tmutunhire@gmail.com",
			   password: "foobar",
			   password_confirmation: "foobar",
			   admin: true)
	
	
	User.create!(name: "Example User",
		     email: "fake@railstutorial.org",
		     password: "foobar",
		     password_confirmation: "foobar")
	99.times do |n|
	    name = Faker::Name.name
	    email = "example-#{n+1}@railstutorial.org"
	    password = "password"
	    User.create!(name: name,
			 email: email,
			 password: password,
			 password_confirmation: password)
	end
	
	users = User.all(limit: 6)
	50.times do
	    
	    users.each { |user|
		content = Faker::Company::bs
		user.microposts.create!(content: content)
	    }
	end
    end
end