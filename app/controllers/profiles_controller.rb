class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.prepare_profile
  end

  def update
    @profile = current_user.prepare_profile
    @profile.assign_attributes(update_params)
    if @profile.save
      redirect_to profile_path, notice: '更新できました'
    else
      flash.now[:error] = '更新に失敗しました'
      render :edit
    end
  end

  private

  def update_params
    params.require(:profile).permit(
      :nickname,
      :introduction,
      :gender,
      :birthday,
      :subscribed,
      :avatar
    )
  end
end
