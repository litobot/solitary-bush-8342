# ### Extension

# ```
# Extension 1 - Ingredients Sorted Alphabetically

# As a visitor,
# When I visit '/ingredients',
# Then I see that the list of ingredients is sorted alphabetically by name

require "rails_helper"

RSpec.describe "Extension #1 - Ingredients Sorted Alphabetically", type: :feature do
  describe "when I visit '/ingredients'" do
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

      visit "/ingredients"
      save_and_open_page
    end

    it "displays all ingredients listed alphabetically" do
      expect("bread").to appear_before("butter")
      expect("butter").to appear_before("cheese")
      expect("cheese").to appear_before("garlic")
      expect("garlic").to appear_before("meat")
      expect("meat").to appear_before("mushrooms")
      expect("mushrooms").to appear_before("pasta")
      expect("pasta").to appear_before("pesto")
      expect("pesto").to appear_before("tomatoes")
    end
  end
end