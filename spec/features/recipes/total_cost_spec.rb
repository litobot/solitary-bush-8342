# User Story 3 - Total Cost

# As a visitor,
# When I visit '/recipes/:id'
# I see the total cost of all of the ingredients in the recipe.
# (e.g. "Total Cost: 22")

require "rails_helper"

RSpec.describe "User Story #3 - Total Cost", type: :feature do
  describe "when I visit '/recipes/:id'" do
    before :each do
      @ingredient_1 = Ingredient.create!(name: "pasta", cost: 12)
      @ingredient_2 = Ingredient.create!(name: "tomatoes", cost: 2)
      @ingredient_3 = Ingredient.create!(name: "pesto", cost: 5)
      @ingredient_4 = Ingredient.create!(name: "cheese", cost: 7)
      
      @recipe_1 = Recipe.create!(name: "Pesto Pasta", complexity: 3, genre: "Italian")
      
      RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_1)
      RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_2)
      RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_3)
      RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_4)
      
      visit "/recipes/#{@recipe_1.id}"
      save_and_open_page
    end

    it "displays the total cost of all the ingredients in the recipe" do
      expect(page).to have_content("Total Cost: #{@recipe_1.total_cost}")
    end
  end
end