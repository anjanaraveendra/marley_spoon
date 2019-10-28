# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  title       :string
#  image_url   :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Recipe < ApplicationRecord

	has_many :recipe_tags
	has_many :tags, through: :recipe_tags

	has_one  :recipe_chef
	has_one  :chef, through: :recipe_chef

	accepts_nested_attributes_for :recipe_tags, allow_destroy: true
	accepts_nested_attributes_for :recipe_chef, allow_destroy: true
end
