require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "relationships" do
    it "belongs to a user" do
      comment = create(:comment)
      expect(comment).to respond_to(:user)
    end
  end
end
