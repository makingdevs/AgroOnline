require 'utilities/estados'

class WelcomeController < ApplicationController

  def index
    if session[:user_id]
      user = User.find(session[:user_id])
      if !user.provider
        redirect_to new_provider_path
      end
   end
   get_element_for_index

  end

  def search
    @products = Product.search(params[:search]).records
    render :template => "/products/index"
  end

  def our
  end

  private
    def get_element_for_index
      @estados = []
      Estados.estados.first().each_slice(4) { | estado |
        @estados << estado
      }
      @michoacan = Product.limit(6).where(:origin => "michoacán")
      @jalisco = Product.limit(6).where(:origin => "jalisco")
      @providers = Provider.limit(4).all()
      @primas = []
      if Category.all.count
        category = Category.find_by name: "materias primas"
        @primas = Product.limit(6).where(:category => category.id)
      end
    end

end
