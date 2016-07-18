class FriendshipsController < ApplicationController
  def index

  end

  def create
    @friend = current_user.friendships.build(friend_id: params[:friend_id])
    if @friend.save
      flash[:success] = 'Added friend successful!'
      redirect_to friends_path
    else
      flash[:error] = "Error: #{@friend.errors.full_messages.to_sentence}"
    end
  end

  def destroy
    @friendship = current_user.friendships.find params[:friend_id]
    @friend = @friendship.friend.find params[:friend_id]
    @friend.destroy
    flash[:success] = 'Removed friend successful!'
    redirect_to friends_path
  end
end
