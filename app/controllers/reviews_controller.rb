class ReviewsController < ApplicationController
before_action :set_review, only: [:edit, :update, :show, :destroy ]

  def index
    @reviews = Review.all
  end

  def edit
  end

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def show
    @comment = Comment.new

  end

  def create
    @product = Product.find(params[:product_id])
    @review = Review.create(review_params)
    if @review.save
      redirect_to product_path(@product.id), notice: "Review Posted"
    else
      render :new
    end
  end

  def update
    if @review.update(review_params)
      redirect_to review_path
    else
      render :edit
    end
  end

  def destroy
  end

  def like
    @review = Review.find(params[:product_id])
    @review.upvote_by current_user
    redirect_to review_path(params[:product_id])
  end

   private


   def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :body, :score).merge(user_id: current_user.id).merge(product_id: @product.id)
  end
end
