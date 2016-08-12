require 'utilities/estados'

class WelcomeController < ApplicationController

  def index
    @estados = []
    Estados.estados.first().each_slice(4) { | estado |
      @estados << estado
    }
    @frutas = Product.where(:origin => "michoacán")
    @jalisco = Product.where(:origin => "jalisco")
  end

  def search
    @products = Product.search(params[:search]).records
    render :template => "/products/index"
  end

  def our
  end

end
