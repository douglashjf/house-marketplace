class FavouritesController < ApplicationController
  def index
    authorize :Favourite
    @favourites = policy_scope(Favourite)
  end
end
