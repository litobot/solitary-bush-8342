# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ingredient_1 = Ingredient.create!(name: "pasta", cost: 12)
ingredient_2 = Ingredient.create!(name: "tomatoes", cost: 2)
ingredient_3 = Ingredient.create!(name: "pesto", cost: 5)
ingredient_4 = Ingredient.create!(name: "cheese", cost: 7)
ingredient_5 = Ingredient.create!(name: "mushrooms", cost: 3)
ingredient_6 = Ingredient.create!(name: "meat", cost: 6)
ingredient_7 = Ingredient.create!(name: "garlic", cost: 1)
ingredient_8 = Ingredient.create!(name: "butter", cost: 1)
ingredient_9 = Ingredient.create!(name: "bread", cost: 4)

recipe_1 = Recipe.create!(name: "Pesto Pasta", complexity: 3, genre: "Italian")
recipe_2 = Recipe.create!(name: "Garlic Bread", complexity: 1, genre: "Italian American")

# Need to create instance of `RecipeIngredient` in order to associate `recipes` with `ingredients`
# We are generating 6 rows in the `RecipeIngredient` table
# Ingredients #5 & #6 are not needed for `recipes` #1 or #2 -> they are excluded
RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_1)
RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_2)
RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_3)
RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_4)

RecipeIngredient.create!(recipe: recipe_2, ingredient: ingredient_7)
RecipeIngredient.create!(recipe: recipe_2, ingredient: ingredient_8)
RecipeIngredient.create!(recipe: recipe_2, ingredient: ingredient_9)