class HousesController < ApplicationController
  before_action :set_house, only: %i[show edit update destroy toggle_favourites]
  skip_before_action :authenticate_user!, only: %i[show index]

  # GET / houses

  def index
    @houses = policy_scope(House)

    if params[:query].present?
      @houses = @houses.search_by_address(params[:query])
    end

    if params[:min_price].present?
      @houses = @houses.where("price >= ?", params[:min_price])
    end

    if params[:max_price].present?
      @houses = @houses.where("price <= ?", params[:max_price])
    end

    if params[:prop_type].present?
      @houses = @houses.where(property_type: params[:prop_type])
    end

    # if params[:bedrm].present?
    #   @houses = @houses.where(bedroom: params[:bedrm])
    # end

    if params[:region].present?
      @houses = @houses.where("region ILIKE ?", "%#{params[:region]}%")
    end

    selected_bedrooms = []
    selected_bedrooms << 1 if params[:bedrooms_1] == "1"
    selected_bedrooms << 2 if params[:bedrooms_2] == "1"
    selected_bedrooms << 3 if params[:bedrooms_3] == "1"
    selected_bedrooms << 4 if params[:bedrooms_4] == "1"
    selected_bedrooms << 5 if params[:bedrooms_5] == "1"

    if selected_bedrooms.present?
      @houses = @houses.where(bedroom: selected_bedrooms)
    end
    # The `geocoded` scope filters only flats with coordinates
    @markers = @houses.geocoded.map do |house|
      {
        lat: house.latitude,
        lng: house.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { house: house })
      }
    end
  end

  # GET / houses/:id
  def show
    @markers = [
      {
        lat: @house.latitude,
        lng: @house.longitude
      }]
    @offer = Offer.new
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

  def toggle_favourites
    if current_user.favourites.exists?(house_id: @house.id)
      current_user.favourites.where(house_id: @house.id).destroy_all
      # flash[:notice] = "Page removed from favourites"
    else
      Favourite.create(user: current_user, house_id: @house.id)
      # flash[:notice] = "Page added to favourites"
    end
  end

  def my_listings
    @user_houses = current_user.houses
  end

  def my_offers
    @user_offers = current_user.offers.includes(:house)
  end

  private

  def set_house
    @house = House.find(params[:id])
    authorize(@house)
  end

  def house_params
    params.require(:house).permit(:address, :price, :bedroom, :bathroom, :square_feet, :description, :property_type, :tenure, :region, photos: [])
  end
end
