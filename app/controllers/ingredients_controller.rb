class IngredientsController < ApplicationController
  def index
    @ingredient = Ingredient.all
  end
end