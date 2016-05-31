class UsersController < ApplicationController
  def index
    render json: User.all
  end


  def favorites
    user = User.find_by(id: params[:user_id])
    favorites = []
    user.contacts.each do |contact|
      if contact.favorited
        favorites.push(contact)
      end
    end

    user.contact_shares.each do |contact_share|
      if contact_share.favorited
        favorites.push(contact_share.contact)
      end
    end
    render json: favorites
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user
  end

  def create
  user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    user = User.find_by(params[:id])
    user.update!(user_params)
    render json: user
  end

  def destroy
    @user = User.find_by(params[:id])
    render json: @user
    @user.destroy!
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end
