class SessionsController < ApplicationController
  before_action :require_user!, only: %i[ destroy ]

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
      @user = user
      session[:user_id] = @user.id
      return redirect_to '/', notice: 'Usuario logado com sucesso'
    end
    @user = User.new(session_params)
    flash[:alert] = "Oops, credenciais erradas..."
    render :new
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
