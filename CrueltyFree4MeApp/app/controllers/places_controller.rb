class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def get_locations
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{params[:latitude]},#{params[:longitude]}&radius=1500&type=store&keyword=cruelty+free&key=#{Rails.application.secrets.google_places_key}"
    http_call = open(url).read
    response = JSON.parse(http_call, {:symbolize_names => true})
    @locations = response[:results]
  end

   def get_stores
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{params[:latitude]},#{params[:longitude]}&radius=1500&type=store&keyword=cruelty+free&key=#{Rails.application.secrets.google_places_key}"
    http_call = open(url).read
    response = JSON.parse(http_call, {:symbolize_names => true})
    @stores = response[:results]
  end

  # GET /places
  # GET /places.json
  def index
    @places = Place.all
  end

  # GET /places/1
  # GET /places/1.json
  def show
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.create(place_params)
     @place.user = current_user
    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: "#{@place.name} was successfully created." }
        format.js {}
      else
        format.html { render :new }
        format.js {}
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: "#{@place.name} was successfully updated." }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: "#{@place.name} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:name, :address)
    end
end
