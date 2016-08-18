require 'utilities/estados'

class WelcomeController < ApplicationController

  def index
    @estados = []
    Estados.estados.first().each_slice(4) { | estado |
      @estados << estado
    }
    @michoacan = Product.limit(6).where(:origin => "michoacan")
    @jalisco = Product.limit(6).where(:origin => "jalisco")
    @providers = Provider.limit(8).all()
  end

  def search
    @products = Product.search(params[:search]).records
    render :template => "/products/index"
  end

  def our
  end

end
