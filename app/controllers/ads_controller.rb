class AdsController < ApplicationController
  before_action :require_user!
  def new
    @ad = Ad.new
  end

  def create
    @ad = current_user.ads.new(ad_params)

    if @ad.save
      return redirect_to root_path, notice: 'anuncio criado com sucesso'
    end

    flash.now[:alert] = "Oops, algo saiu errado."
    render :new
  end

  private

  def ad_params
    params.require(:ad).permit(:title, :description, :price)
  end
end
