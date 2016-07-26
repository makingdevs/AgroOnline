class UserMailer < ApplicationMailer

  default from: "juan@makingdevs.com"

  def welcome_email(params)
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    mail(to: 'sergio@makingdevs.com', subject: 'New Message of Nos Unimos')
  end

end
