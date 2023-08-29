class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @houses = House.all
    @top_houses = House.order(price: :desc).limit(4)
  end
end
