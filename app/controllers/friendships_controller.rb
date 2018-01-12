class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])

    if @friendship.save
      flash[:notice] = "Successfully be friend!"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = @friendship.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @friendship = current_user.friendships.where(friend_id: params[:id]) #取出來的是陣列
    @friendship.destroy_all #用直接刪除陣列的方法
    flash[:alert] = "Friendship destroyed"
    redirect_back(fallback_location: root_path)
  end

end
