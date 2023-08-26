class HousesController < ApplicationController
  before_action :set_house, only: %i[show edit update destroy]

  # GET / houses

  def index
    @houses = House.all
  end

  # GET / houses/:id
  def show
  end

  # GET / houses/new
  def new
    @house = House.new
  end

  def edit
  end

  def create
    @house = House.new(house_params)
    @house.user = current_user
    if @house.save
      redirect_to houses_path(@house)
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

  private

  def set_house
    @house = House.find(params[:id])
  end

  def house_params
    params.require(:house).permit(:address, :price, :bedroom, :bathroom, :square_feet, :description, :property_type, :tenure)
  end
end
