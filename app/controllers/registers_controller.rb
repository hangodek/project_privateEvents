class RegistersController < ApplicationController
  allow_unauthenticated_access only: %i[ new ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user.params)
    if @user.save
      redirect_to new_session_path
    else
      render :new, status: :unprocessable_identity
    end
  end

  private

  def user_params
    params.expect(user: [ :username, :email_address, :password ])
  end
end
