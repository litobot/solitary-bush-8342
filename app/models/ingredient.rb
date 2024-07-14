class Ingredient < ApplicationRecord
   validates :name, :cost, presence: true

   # This was confusing even with the model tests already built.
   # I kept thinking that the ingredients belonged to just one recipe,
      # but of course, that's wrong.
   # garlic could be an ingredient in either a garlic bread recipe or it could go in a pasta, etc.
   # That's why we have the `recipe_ingredients` table -> to make those associations
   # I can do this, but I still don't get it 100%
   has_many :recipe_ingredients
   has_many :recipes, through: :recipe_ingredients
end
