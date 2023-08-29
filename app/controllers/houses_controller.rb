class HousesController < ApplicationController
  before_action :set_house, only: %i[show edit update destroy]


  # GET / houses

  def index
    @houses = policy_scope(House)
  end

  # GET / houses/:id
  def show
  end

  # GET / houses/new
  def new
    @house = House.new
    authorize(@house)
  end

  def edit
  end

  def create
    @house = House.new(house_params)
    @house.user = current_user
    authorize(@house)
    if @house.save
      redirect_to house_path(@house)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @house.update(house_params)
    if @house.save
      redirect_to @house
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @house.destroy
    redirect_to houses_path, status: :see_other
  end

  # def category
  #   @category = params[:category]
  #   @houses = House.where(category: @category[0...-1])
  # end

  def my_listings
    @user_houses = current_user.houses
  end

  def my_offers
    @user_offers = current_user.offers.map do |offer|
      offer.house
    end
  end

  private

  def set_house
    @house = House.find(params[:id])
    authorize(@house)
  end

  def house_params
    params.require(:house).permit(:photo, :address, :price, :bedroom, :bathroom, :square_feet, :description, :property_type, :tenure)
  end
end
