require 'test_helper'

class ContentfulControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contentful_index_url
    assert_response :success
  end

end
