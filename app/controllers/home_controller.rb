class HomeController < ApplicationController
  before_action :require_user!

  def show
    @ads = Ad.all
  end
end
