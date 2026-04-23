class PetsController < ApplicationController
  def index
    @pets =
      if params[:species]
        Pet.by_species(params[:species])
      else
        Pet.all
      end
  end

  def show
    @pet = Pet.includes(:appointments).find(params[:id])
  end
end