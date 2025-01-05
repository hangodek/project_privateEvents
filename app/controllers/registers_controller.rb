class RegistersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
    else
      flash.now[:alert] = "The username or email has been registered"
      render :new, status: :unprocessable_entity    end
  end

  private
    def user_params
      params.expect(user: [ :username, :email_address, :password ])
    end
end
