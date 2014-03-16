require 'spec_helper'

describe UsersController do
  render_views
  describe "GET 'index'" do
    let(:attrs) { {id: 1, email: "a@b.com", username: "b"} }
    let!(:user) { User.create(attrs)}
    it "returns json" do 
      get :index, format: :json
      expect(response.body).to eq({results: [attrs]}.to_json)
    end
  end
end
