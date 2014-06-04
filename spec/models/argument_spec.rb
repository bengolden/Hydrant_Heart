require_relative '../spec_helper'

describe Argument do 
  context "object's associations:" do
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

  context "object's validations" do
    

  end
end