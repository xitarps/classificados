class UsersController < ApplicationController
  before_action :redirect_if_already_signed_in, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if same_password?
      if @user.save 
        session[:user_id] = @user.id
        NotificationMailer.welcome(@user.name, @user.email).deliver_later
        return redirect_to '/', notice: 'Usuario cadastrado com sucesso'
      end
    else
      @user.errors.add(:base, 'Senhas não são idênticas') # need to move to model
    end

    render :new
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :confirm_password).except(:confirm_password)
  end

  def same_password?
    passw_a = params.require(:user).permit(:name, :email, :password, :confirm_password).delete(:password)
    passw_b = params.require(:user).permit(:name, :email, :password, :confirm_password).delete(:confirm_password)

    !! (passw_a == passw_b)
  end
end
