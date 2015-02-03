class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  end

  # GET /profiles/1
  def show
    @profile = current_user.profile
  end

  # GET /profiles/new
  def new
    @user = current_user
    @user.build_profile
    @user.profile.user_id = @user.id
  end

  # GET /profiles/1/edit
  def edit
    @user = current_user.id
    Profile.find_by(user_id: @user)
    
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = current_user.build_profile(profile_params)
    raise

    respond_to do |format|
      if @profile.save
        format.html { redirect_to user_profile_path, notice: 'Profile was successfully created.' }
        format.json { render action: 'index', status: :created, location: @profile }
      else
        format.html { render action: 'new', location: @profile }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    raise
    respond_to do |format|
      if current_user.create_profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        raise
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
      params.require(:profile).permit(:firstname, :lastname, :birthdate, :address1, :address2, :city, :statename, :zipcode, :phonenum, :prescription_num, :prescription_exp, :prescription_card, :idcard, :verified)
    end
    
    ###### http://stackoverflow.com/questions/17737709/paperclip-in-rails-4-strong-parameters-forbidden-attributes-error
end
