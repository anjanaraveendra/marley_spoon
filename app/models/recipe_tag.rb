# == Schema Information
#
# Table name: recipe_tags
#
#  id         :integer          not null, primary key
#  recipe_id  :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RecipeTag < ApplicationRecord
  belongs_to :recipe
  belongs_to :tag, optional: true
end
