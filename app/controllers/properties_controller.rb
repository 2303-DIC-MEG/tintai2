class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all
  end

  def show
    @nearest_stations = @property.nearest_stations
  end

  def new
    @property = Property.new
    2.times { @property.nearest_stations.build }
  end

  def edit
    @property.nearest_stations.build
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path
    else
      render :new
    end
  end

  def update
    if @property.update(property_params)
      redirect_to properties_path
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_path
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:property, :rent, :building_age, :address, :remark,
    nearest_stations_attributes: [
      :railway_line,
      :station_name,
      :minutes_walk,
      :property_id,
      :id,
      :_destroy,
      ],
    )
  end
end
