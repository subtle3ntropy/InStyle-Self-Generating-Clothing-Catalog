class WelcomeController < ApplicationController
  def index
  	@reviews = Review.all
  	@product = Product.all 
  	@user = User.all
  end

  private
 
end
