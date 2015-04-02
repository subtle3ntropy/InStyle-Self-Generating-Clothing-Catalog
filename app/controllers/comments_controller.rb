class CommentsController < ApplicationController
  def index
    @comment = Comment.find(@review.id)

  end

  def edit
  end

  def new
    @review = Review.find(params[:review_id])
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(@review.id)
  end

  def create
    @review = Review.find(params[:review_id])
    @comment = Comment.create(comment_params)
     if @comment.save
      redirect_to review_path(@review.id), notice: "Comment Posted"
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end
    private
  
  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id).merge(review_id: @review.id)
  end
end
