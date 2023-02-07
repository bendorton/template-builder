# class definition for ProfileController
class ProfilesController < ApplicationController
  # before_action to set profile instance variable and is accessible by only index, show, edit, update and destroy actions
  before_action :set_profile, only: %i[index show edit update destroy]

  # index action for displaying multiple profiles
  def index; end

  # show action for displaying individual profile based on id
  def show; end

  # new action for creating a new profile
  def new
    # creating new profile associated with current user
    @profile = Profile.new
    @profile.user = current_user
  end

  # edit action for editing existing profile
  def edit; end

  # create action for creating a new profile
  def create
    # creating new profile based on profile params permitted
    @profile = Profile.new(profile_params)

    # handling both HTML and JSON request format
    respond_to do |format|
      if @profile.save
        # if profile saves successfully, redirect to profiles path with a notice
        format.html { redirect_to profiles_path, notice: 'Profile was successfully created.' }
        # render show action with created status and profile location in JSON response
        format.json { render :show, status: :created, location: @profile }
      else
        # render new action with unprocessable_entity status in HTML response
        format.html { render :new, status: :unprocessable_entity }
        # render errors in json along with unprocessable entity status for JSON request
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # update action for updating existing profile
  def update
    # handling both HTML and JSON request format
    respond_to do |format|
      if @profile.update(profile_params)
        # if profile updates successfully, redirect to profiles path with a notice
        format.html { redirect_to profiles_path, notice: 'Profile was successfully updated.' }
        # render show action with ok status and profile location in JSON response
        format.json { render :show, status: :ok, location: @profile }
      else
        # render edit action with unprocessable_entity status in HTML response
        format.html { render :edit, status: :unprocessable_entity }
        # render errors in json along with unprocessable entity status for JSON request
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # destroy action for deleting the existing profile
  def destroy
    # delete profile
    @profile.destroy
    # handling both HTML and JSON request format
    respond_to do |format|
      # redirect to profiles path with a notice in HTML format
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      # render no content in JSON format
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = current_user.profile || Profile.new(user: current_user)
  end

  # Only allow a list of trusted parameters through.
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :email, :phone, :url, :user_id)
  end
end
