# == Schema Information
#
# Table name: recipe_chefs
#
#  id         :integer          not null, primary key
#  recipe_id  :integer
#  chef_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RecipeChef < ApplicationRecord
  belongs_to :recipe
  belongs_to :chef, optional: true
end
