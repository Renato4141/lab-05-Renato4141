class VetsController < ApplicationController
  def index
    @vets =
      if params[:specialization]
        Vet.by_specialization(params[:specialization])
      else
        Vet.all
      end
  end

  def show
    @vet = Vet.includes(:appointments).find(params[:id])
  end
end