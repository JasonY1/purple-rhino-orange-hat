class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @user = current_user.id
    @profile = Profile.new(user_id: @user)
  end
  
  def new
    @user = User.new
    @user.build_profile
  end
  
  def create
    @user = User.create(user_params)
    @profile = @user.build_profile

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
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
