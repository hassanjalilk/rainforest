class ReviewController < ApplicationController

	before_filter :load_product

  def show
  	@review = Review.find(params[:id])
  end

  def create
  	@review = @product.review.build(review_params)
  	@review_id = current_user_id
  	if @review.save
  		redirect_to products_path, notice: 'Review created successfully'
  	else
  		render 'products/show'
  	end
  end

  def destroy

  	@review = Review.find(params[:id])
  	@review.destroy
  end

  private

  def review_params
  	params.require(:review).permit(:comment, :product_id)
  end

  def load_product
  	@product = Product.find(paramas[:product_id])
  end

end

