class UsersController < ApplicationController
  def index
  @user = User.all
end
def new
  @user = User.new
end
def create
 @user = User.new(user_params)
 if @user.save
   session[:user_id] = @user.id
   redirect_to '/'
 else
   redirect_to '/signup'
 end
end
def edit
    @user = User.find(params[:id])
end
def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to '/users'
    else
      render 'edit'
    end
  end
def destroy
  @user = User.find(params[:id])
  @user.destroy
  redirect_to '/'
end
private
  def user_params
    params.require(:user).permit(:username, :password)
  end
  before_action :require_admin, only: [:delete, :edit, :index]
  before_action :require_mod, only: [:index, :delete]
  before_action :require_editor, only: [:edit]
 end
end
