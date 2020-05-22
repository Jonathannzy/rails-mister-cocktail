class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, presence: true, uniqueness: true
  before_destroy :check_for_cocktail

  private

  def check_for_cocktail
    if Cocktail.count > 0
      errors.add_to_base("can't delete while used by cocktail")
      return false
    end
   end
end
