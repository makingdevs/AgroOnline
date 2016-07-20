require 'utilities/estados'

class WelcomeController < ApplicationController

  def index
    @estados = []
    Estados.estados.first().each_slice(4) { | estado |
      @estados << estado
    }
  end

end
