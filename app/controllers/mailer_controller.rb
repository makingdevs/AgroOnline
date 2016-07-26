class MailerController < ApplicationController

  def contact
    UserMailer.welcome_email(params).deliver
    @product = Product.find(params[:id])
    redirect_to @product
  end

end
