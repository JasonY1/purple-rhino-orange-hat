class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    
  end

  # GET /profiles/1
  def show
    @user = current_user
    @profiles = @user.profile
  end

  # GET /profiles/new
  def new
    @user = current_user
    @profile = current_user.build_profile
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @user = current_user
    @profile = current_user.build_profile(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to user_profiles_path(@profile), notice: 'Profile was successfully created.' }
        format.json { render action: 'index', status: :created, location: @user.profile }
      else
        format.html { render action: 'new', location: @user.profile }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    @profile = current_user.build_profile(profile_params)
    
    respond_to do |format|
      if @profile.update
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:firstname, :lastname, :address1, :address2, :city, :statename, :zipcode, :phonenum, :prescription_num, :prescription_exp, :prescription_id, :valid_id, :verified)
    end
end
