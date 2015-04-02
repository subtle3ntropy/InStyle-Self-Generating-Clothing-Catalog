class ProductsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :edit, :update, :create, :destroy]
  impressionist
  before_action :set_product, only: [:edit, :update, :show, :destroy ]
  def index
    @products = Product.all 
  end

  def edit
  end

  def new
    @product = Product.new
  end

  def show

    @review = Review.new
    @product = Product.find(params[:id])
    impressionist(@product)
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to @product, notice: "Product created"
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_product 
    @product = Product.find(params[:id])
  end

  def product_params 
    params.require(:product).permit(:name, :description, :priced, :main_image, :image1, :image2, :image3, :impressions_count)

  end


end
