require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a comment" do
        user = create(:user)
        comment = Comment.new(winner: 1, loser: 2, user: user)
        expect(comment).to be_invalid
      end

      it "is invalid without a comment length >= 2" do
        user = create(:user)
        comment = Comment.new(winner: 1, loser: 2, user: user, comment: 'b')
        expect(comment).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        user = create(:user)
        comment = Comment.new(winner: 1, loser: 2, user: user, comment: 'blah')
        expect(comment).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a user" do
      comment = create(:comment)
      expect(comment).to respond_to(:user)
    end
  end
end
