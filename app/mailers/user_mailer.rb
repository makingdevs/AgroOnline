class UserMailer < ApplicationMailer

  default from: "sergio@makingdevs.com"

  def welcome_email(params)
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    @quantity = params[:cantidad]
    @unidad = params[:unidad]
    mail(to: 'sergio@makingdevs.com', subject: 'New Message of Nos Unimos')
  end

end
