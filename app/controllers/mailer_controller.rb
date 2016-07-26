class MailerController < ApplicationController

  def contact
    puts "send email to provider"
    UserMailer.welcome_email(params).deliver
    @product = Product.find(params[:id])
    redirect_to @product
  end

end
