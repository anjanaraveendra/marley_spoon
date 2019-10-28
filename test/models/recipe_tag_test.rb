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

require 'test_helper'

class RecipeTagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
