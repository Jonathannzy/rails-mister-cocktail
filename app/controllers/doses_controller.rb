class DosesController < ApplicationController
  def new
    @the_cocktail = Cocktail.find(params[:cocktail_id])
    @new_dose = Dose.new
    @new_dose.cocktail = @the_cocktail
  end

  def create
    @the_cocktail = Cocktail.find(params[:cocktail_id])
    @new_dose = @the_cocktail.doses.build(dose_params)



    if @new_dose.valid?
     @new_dose.description = params[:dose][:description]
     @new_dose.ingredient = Ingredient.find(params[:dose][:ingredient_id])
     redirect_to cocktail_path(@the_cocktail) if @new_dose.save
   else
    render :new
  end
end


    # def destroy
    #   @the_dose = Dose.find(params[:id])
    #   @dose.destroy

    #   redirect_to "cocktails/show"
    # end

    private
    def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end
  end
