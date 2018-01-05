class FollowsController < ApplicationController
  # load_and_authorize_resource
  before_action :set_user
  
  def create
    respond_to do |format|
      if current_user.follow(@user)
        format.json { render @user, status: :created }
        format.html { redirect_back fallback_location: root_path, notice: 'User followed with success.' }
      else
        format.json { render json: nil, status: :unprocessable_entity }
        format.html { redirect_back fallback_location: root_path }
      end
    end
  end

  def destroy
    respond_to do |format|
      if current_user.stop_following(@user)
        format.json { head :no_content }
        format.html { redirect_back fallback_location: root_path, notice: 'User unfollowed with success.'}
      else
        format.json { render json: nil, status: :unprocessable_entity }
        format.html { redirect_back fallback_location: root_path }        
      end
    end
  end

  private

    def set_user
      @user = User.find(params[:user_id])
    end
end