# CRUD Routes for Flats
class FlatsController < ApplicationController
  # index Read All
  def index
    @flats = Flat.all
  end

  # Create
  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user_id = current_user.id
    @flat.save

    redirect_to flat_path(@flat)
  end

  # show Read One
  def show
    @flat = Flat.find(params[:id])
  end

  # update
  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)

    redirect_to flat_path(@flat)
  end

  # delete
  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy

    redirect_to flats_path, status: :see_other
  end

  def myflats
    @flats = current_user.flats
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :price, :photo)
  end
end
