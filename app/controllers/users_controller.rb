class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @user = current_user
  end
  
  def update
    @user = current_user
    @profile = @user.create_profile
    
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
        raise
      else
        format.html { redirect_to new_user_profile_path(@user), notice: 'Profile not created' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:email,
          profile_attributes: [:firstname, :lastname, :birthdate, :address1, :address2, :city, :statename, :zipcode, :phonenum, :prescription_num, :prescription_exp, :prescription_card, :idcard, :verified])
    end
    
end
