class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friending_id: params[:friending_id])

    if @friendship.save
      flash[:notice] = "Successfully be friend!"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = @friendship.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end
end
