require_relative '../spec_helper'

describe Argument do
  context "object" do
    it "#author returns the creator" do
      should belong_to(:author).class_name('User')
    end

    it "#conclusion returns the claim it supports or refutes" do
      should belong_to(:conclusion).class_name('Claim')
    end

    it "#assumptions returns all its assumptions" do
      should have_many(:assumptions)
    end

    it "#premises returns a collection of claims supporting the argument" do
      should have_many(:premises).through(:assumptions)
    end

    it "#votes returns all the votes associated with the argument" do
      should have_many(:votes).with_foreign_key('voteable_id')
    end
  end

  context "a new object" do
    let(:argument) { Argument.create(author_id: 1, conclusion_id: 4, is_supporting: false)}
    let(:argument2) { Argument.create(author_id: 5, conclusion_id: 7, is_supporting: true)}

    it "knows its author" do
      expect(argument.author_id).to eq(1)
    end

    it "knows its conclusion" do
      expect(argument.conclusion_id).to eq(4)
    end

    it "knows if it is supporting a claim or not" do
      expect(argument2.is_supporting).to eq(true)
    end
  end

  context "validations:" do
    it "is_supporting should have a boolean." do
      should ensure_inclusion_of(:is_supporting).in_array([true, false])
    end

    it "its body should not be empty" do
      should validate_presence_of(:conclusion)
    end

    xit "it should have an author" do
      should validate_presence_of(:author)
    end
  end

end
