require_relative 'spec_helper'


describe Vote do

  context "attributes" do
    it "has an attribute user_id" do
      should allow_value(1).for(:user_id)
    end
    it "has an attribute voteable_id" do
      should allow_value(2).for(:voteable_id)
    end
    it "has an attribute voteable_type" do
      should allow_value(Argument).for(:voteable_type)
    end
  # It currently takes strings as well, perhpas validations are the solution here?
    it "does not allow a value other than a voteable class as a value for voteable type"
    it "has an attribute value" do
      should allow_value(true).for(:value)
    end
  end

  context "associations" do
    it "belongs to a user" do
      should belong_to(:user)
    end
    it "belongs to a voteable" do
      should belong_to(:voteable)
    end
  end

  context "validations:" do
    it "its type of vote should be specified" do
      should validate_presence_of(:voteable_type)
    end

    it "its value should be a boolean." do
      should ensure_inclusion_of(:value).in_array([true, false])
    end

    it "the user who voted" do
      should validate_presence_of(:user)
    end
  end
end
