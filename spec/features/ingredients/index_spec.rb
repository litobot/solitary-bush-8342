# User Story 1 - Ingredients Index

# As a visitor,
# When I visit '/ingredients'
# I see a list of all the ingredients including their name and cost
# (e.g. "Ground Beef: 2"
#      "Salt: 4")

require "rails_helper"

RSpec.describe "User Story #1 - Ingredient Index", type: :model do
  describe "When I visit '/ingredients'" do
    it "I see a list of all the ingredients - including their name and cost" do
      ingredient_1 = Ingredient.create!(name: "pasta", cost: 12)
      ingredient_2 = Ingredient.create!(name: "tomatoes", cost: 2)
      ingredient_3 = Ingredient.create!(name: "pesto", cost: 5)
      ingredient_4 = Ingredient.create!(name: "cheese", cost: 7)

      visit "/ingredients"
      save_and_open_page

      expect(page).to have_content("pasta")
      expect(page).to have_content("tomatoes")
      expect(page).to have_content("pesto")
      expect(page).to have_content("cheese")
      
      expect(page).to_not have_content("olives")
      expect(page).to_not have_content("meat")
      expect(page).to_not have_content("bread")
      expect(page).to_not have_content("wine")
    end
  end
end