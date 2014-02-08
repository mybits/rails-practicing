class UserMailer < ActionMailer::Base
  default from: "info@testblog.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.hello.subject
  #
  def hello
    @user = user
    mail to: user.email, subject: 'Hello'
  end
end
