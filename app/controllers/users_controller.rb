class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    redirect_to "show"
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
    profile = @user.profiles.build
  end
  
  def create
    @user = User.new(user_params)
    @profile = current_user.profiles.build(params[:profile])

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
