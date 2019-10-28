require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
	let(:recipe) { FactoryBot.create(:recipe) }
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "responds with collection of recipes" do
	    get :index
	    assigns(:recipes).should eq([recipe])
	  end
	end
end
