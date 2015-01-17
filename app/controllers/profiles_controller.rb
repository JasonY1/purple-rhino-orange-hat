class ProfilesController < ApplicationController

  # GET /profiles
  # GET /profiles.json
  # def index
    # @profiles = Profile.all
  # end
  
  # def index
    # if params[:ids]
      # @profiles = Profile.where(:id => params[:ids].split(","))
    # elsif params[:q]
      # @profiles = Profile.ransack(params[:q]).result
    # else
      # @profiles = Profile.all
    # end
# 
    # @profiles = @profiles.distinct.page(params[:page]).per(params[:per_page])
    # #expires_in 15.minutes, :public => true
    # headers['Surrogate-Control'] = "max-age=#{15.minutes}"
  # end
  
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find(params[:id])
  end

  # GET /profiles/new
  def new
    @user = User.find(params[:user_id])
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
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
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id]) rescue nil
      # @profile ||= Profile.find_by(slug: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:user_id, :firstname, :lastname, :birthdate, :phonenum, :prescription_num, :prescription_exp, :verified)
    end
end
