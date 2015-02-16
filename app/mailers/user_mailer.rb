class UserMailer < ActionMailer::Base
  default from: "noreplay@Storyboard-OOP-NCSU.winbobob"

  def welcome_email(developer)
  	@developer = developer
  	mail(to: @developer.email, subject: "Welcome to Storyboards!!")
  end	
end
