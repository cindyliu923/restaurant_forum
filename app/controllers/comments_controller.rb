class CommentsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = @restaurant.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "留言成功！"
      redirect_to restaurant_path(@restaurant)
    else
      @restaurant = Restaurant.find(params[:restaurant_id])     
      flash[:alert] = "留言不可以空白!!"
      redirect_to restaurant_path(@restaurant)
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = Comment.find(params[:id])

    if current_user.admin?
      @comment.destroy
      redirect_to restaurant_path(@restaurant)
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
