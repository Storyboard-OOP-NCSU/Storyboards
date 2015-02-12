class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
  	@user = user
  	@url = "0.0.0.0:3000/login"
  	mail(to: @developer.email, subject: "Welcome to Storyboards!!")
  end	
end
