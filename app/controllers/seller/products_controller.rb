class Seller::ProductsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_product_and_check_permission, only: [:show, :edit, :update, :destroy]
  layout "seller"

  def index
    @products = current_user.products
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.save
      redirect_to seller_products_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to seller_products_path
    else
      render :edit
    end
  end

 private

  def find_product_and_check_permission
    @product = product.find(params[:id])

    if current_user != @product.user
      redirect_to leader_products_path, alert: "You have no permission."
    end
  end

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image)
  end

end
