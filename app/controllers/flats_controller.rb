class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end
  def show
    @flat = Flat.find(params[:id])
  end
  def new
    @flat = Flat.new
  end
  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end
  def edit
    @flat = Flat.find(params[:id])
  end
  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    if @flat.save
      redirect_to flats_path
    else
      render :edit
    end
  end


  def flat_params
    params.require(:flat).permit(:name, :address, :number_of_guests, :description, :price_per_night)
  end
end


