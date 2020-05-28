class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @new_cocktail = Cocktail.new
  end

  def create
    @new_cocktail = Cocktail.new(cocktail_params)

    if @new_cocktail.save
      redirect_to @new_cocktail
    else
      render :new
    end
  end

  private
  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
