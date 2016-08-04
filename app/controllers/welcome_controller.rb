require 'utilities/estados'

class WelcomeController < ApplicationController

  def index
    @estados = []
    Estados.estados.first().each_slice(4) { | estado |
      @estados << estado
    }
  end

  def search
    @products = Product.search(params[:search]).records
    render :template => "/products/index"
  end

  def our
  end

end
