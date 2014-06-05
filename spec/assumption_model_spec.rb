require_relative 'spec_helper'

describe Assumption do
  describe "has attributes" do
    let(:assumption) { Assumption.new(premise_id: 705, argument_id: 956) }

    it "has premise id" do
      expect(assumption.premise_id).to eq(705)
    end

    it "has argument id" do
      expect(assumption.argument_id).to eq(956)
    end

  end

  describe "has necessary associations" do
    it { should belong_to(:premise).class_name('Claim') }
    it { should belong_to(:argument) }

  end

  describe "validations:" do
    it "it should have a reference to argument" do
      should validate_presence_of(:argument)
    end

    it "it should have a reference to its premise" do
      should validate_presence_of(:premise)
    end
  end

end
