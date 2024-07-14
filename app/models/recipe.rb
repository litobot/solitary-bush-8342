class Recipe < ApplicationRecord
   validates :name, :complexity, :genre, presence: true

   has_many :recipe_ingredients
   has_many :ingredients, through: :recipe_ingredients

   # This is a helper method to sum up the cost of each individual ingredient.
   # We're doing an AR query agains the `ingredients` table
      # We're saying "Find all of the values in the `costs` column of the ingredients table
      # for each object, add them together and return that total to me"
   # This goes in the `recipes` model because we want to call it on a single recipe_ingredients
      # to know how much all of the ingredients associated with it costs. 
      # (How much does it cost to make this one recipe?)
   def total_cost
      ingredients.sum(:cost)
   end
end
