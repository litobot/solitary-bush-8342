# User Story 2 - Recipes Show

# As a visitor,
# When I visit '/recipes/:id',
# Then I see the recipe's name, complexity and genre,
# and I see a list of the names of the ingredients for the recipe.

require "rails_helper"

RSpec.describe "User Story #2 - Recipes Show Page", type: :feature do
  describe "when I visit '/recipes/:id" do
    before :each do
      @ingredient_1 = Ingredient.create!(name: "pasta", cost: 12)
      @ingredient_2 = Ingredient.create!(name: "tomatoes", cost: 2)
      @ingredient_3 = Ingredient.create!(name: "pesto", cost: 5)
      @ingredient_4 = Ingredient.create!(name: "cheese", cost: 7)
      @ingredient_5 = Ingredient.create!(name: "mushrooms", cost: 3)
      @ingredient_6 = Ingredient.create!(name: "meat", cost: 6)
      @ingredient_7 = Ingredient.create!(name: "garlic", cost: 1)
      @ingredient_8 = Ingredient.create!(name: "butter", cost: 1)
      @ingredient_9 = Ingredient.create!(name: "bread", cost: 4)

      @recipe_1 = Recipe.create!(name: "Pesto Pasta", complexity: 3, genre: "Italian")
      @recipe_2 = Recipe.create!(name: "Garlic Bread", complexity: 1, genre: "Italian American")

      # Need to create instance of `RecipeIngredient` in order to associate `recipes` with `ingredients`
      # We are generating 6 rows in the `RecipeIngredient` table
      # Ingredients #5 & #6 are not needed for `recipes` #1 or #2 -> they are excluded
      RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_1)
      RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_2)
      RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_3)

      RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_7)
      RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_8)
      RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_9)
      
      visit "/recipes/#{@recipe.id}"
      save_and_open_page
    end

    it "I see the recipe's name, complexity, and genre" do
      expect(page).to have_content(@recipe.name)
      expect(page).to have_content(@recipe.complexity)
      expect(page).to have_content(@recipe.genre)
    end

    it "I see a list of ingredients for each recipe" do
      # Happy Path
      # We should see these ingredients listed underneath their associated recipes
        # on the '/recipes/:id' (show) page
      expect(page).to have_content("pasta")
      expect(page).to have_content("tomatoes")
      expect(page).to have_content("cheese")

      expect(page).to have_content("garlic")
      expect(page).to have_content("butter")
      expect(page).to have_content("bread")

      # Sad Path
      # We should NOT see these ingredients anywhere on this page
        # as they are not associated with any of the recipes we have
      expect(page).to_not have_content("olives")
      expect(page).to_not have_content("meat")
    end
  end
end