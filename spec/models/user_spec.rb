require 'spec_helper'

describe User do
  let(:user) {User.new(email: "b@c.com", username: "b")}
  describe "validates" do 
    it "the defaults" do
      expect(user).to be_valid
    end
    
    it "requires an email" do
      user.email = nil
      expect(user).to be_invalid
    end
    
    it "requires a username" do
      user.username = nil
      expect(user).to be_invalid
    end
  end
end
