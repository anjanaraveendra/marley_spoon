class RecipesController < ApplicationController

	before_action :set_recipe, only: %i(show)

  def index
  	@recipes = Recipe.all.includes(:tags, :chef)
  end

  def show
  end

  private

  def set_recipe
  	@recipe = Recipe.find(params[:id])
  end
end
