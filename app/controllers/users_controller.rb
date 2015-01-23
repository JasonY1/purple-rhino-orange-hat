class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  end
  
  def show
    @user = current_user
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.create(user_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @user, notice: 'User Account successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
  end
  
  private
  
    def user_params
      params.require(:user).permit(user)
    end
end
