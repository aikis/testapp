class UserMailer < ActionMailer::Base
  default from: "aikismax@gmail.com"

  def congratulation_mail(user)
    @user = user
    mail(:to => user.email, 
          :subject => "Registration successfull!")
  end
end
