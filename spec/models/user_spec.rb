require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a census id" do
        user = User.new()
        expect(user).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        user = User.new(census_id: 14)
        expect(user).to be_valid
      end
    end

    describe "relationships" do
      it "has many comments" do
        user = create(:user)
        expect(user).to respond_to(:comments)
      end
    end
  end
end
