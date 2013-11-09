class UsersController < ApplicationController
  
  def index
    unless current_user
      p devbootcamp_oauth_authorize_url
    end
    p "#" * 50
    p session[:oauth_token]
    p session[:current_user_attributes]
    p "#" * 50
    p current_user
    p "#" * 50
  end

  def create
  @user = current_user
    @user = User.create(user_params)
    if @user
      redirect_to "#"
    else
      #throw error
    end
  end

  private

  include ApplicationHelper

  def user_params
    params.required(:user).permit( :name,
                                   :socrates_id,
                                   :email,
                                   :cohort_id,
                                   :coach
                                  )
  end
end
