class WelcomeController < ApplicationController
  def index
    flash[:notice] = "欢迎来到超级个体营"
  end
end
