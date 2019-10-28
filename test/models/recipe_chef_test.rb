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

require 'test_helper'

class RecipeChefTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
