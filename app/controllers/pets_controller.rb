class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def create
    Pet.create(pet_params)
  end

  def destroy
    pet = Pet.find(params[:id])
    pet.destroy
  end

  private
  def pet_params
    params.require(:pet).permit(:name, :image, :text)
  end
end
