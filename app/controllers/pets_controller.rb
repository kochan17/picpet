class PetsController < ApplicationController
  before_action :set_pet, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]
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

  def edit
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)
  end

  def show
  end

  private
  def pet_params
    params.require(:pet).permit(:name, :image, :text)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
