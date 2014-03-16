require 'spec_helper'

describe UsersController do
  render_views
  let(:attrs) { {id: 1, email: "a@b.com", username: "b"} }
  
  describe "GET 'index'" do
    let!(:user) { User.create(attrs)}
    
    it "returns json" do 
      get :index, format: :json
      expect(response.body).to eq({results: [attrs]}.to_json)
    end
  end
  
  describe "GET 'show'" do
    let!(:user) { User.create(attrs)}
    
    it "returns json" do
      get :show, id: user.id, format: :json
      expect(response.body).to eq(attrs.to_json)
    end
  end
  
  describe "POST 'create'" do 
    let(:request) { post :create, user: attrs, format: :json }
    
    it "creates a user" do
      expect { request }.to change(User, :count).by(1)
    end
    
    it "returns json" do
      request
      attrs.merge!(id: assigns(:user).id)
      expect(response.body).to eq(attrs.to_json)
    end
    
    it "returns a 201" do
      request
      expect(response.status).to eq 201
    end
  end
  
  describe "DELETE 'destroy'" do
    let!(:user) { User.create(attrs)}
    
    it "returns no content" do
      delete :destroy, id: user.id, format: :json
      expect(response.body).to be_blank
      expect(response.status).to eq 204
    end
    
    it "destroys a record" do 
      expect { delete :destroy, id: user.id, format: :json }.to change(User, :count).by(-1)
    end
  end
end
