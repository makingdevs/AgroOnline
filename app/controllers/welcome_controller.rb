require 'utilities/estados'

class WelcomeController < ApplicationController

  def index
    @estados = []
    Estados.estados.first().each_slice(4) { | estado |
      @estados << estado
    }
  end

  def search
    products = Product.where("origin LIKE ?", "%#{params[:search]}%")
    productList = products.group_by { |d| d[:category_id] }
    @categories = Category.where( id: productList.keys)
    render :template => "/categories/index"
  end

end
