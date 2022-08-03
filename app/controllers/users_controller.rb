class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  def index
    @users = User.index_all.page(params[:page])
  end

  def show; end

  def followings
    user = User.find(params[:id])
    @users = user.following
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
