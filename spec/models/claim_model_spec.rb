require_relative '../spec_helper'

describe Claim do
  describe "has attributes" do
    let(:claim) { Claim.new(author_id: 1, body: "Everything is awesome.") }

    it "has an author_id" do
      expect(claim.author_id).to eq(1)
    end

    it "has a body" do
      expect(claim.body).to eq("Everything is awesome.")
    end
  end

  describe "has necessary associations" do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:arguments_where_conclusion).class_name('Argument').with_foreign_key('conclusion_id')}
    it { should have_many(:assumptions_where_premise).class_name('Assumption').with_foreign_key('premise_id')}
    it { should have_many(:arguments_where_premise).through(:assumptions_where_premise).source(:argument)}
    it { should have_many(:votes).with_foreign_key(:voteable_id)}
  end

  describe "has validations:" do
    it "its body should not be empty" do
      should validate_presence_of(:body)
    end

    it "its body should have no more than 140 characters" do
      should ensure_length_of(:body).is_at_most(140).with_long_message("Its like Twitter, only 140 characters per claim.  That's fun!")
    end

    it "it should have a reference to an author" do
      should validate_presence_of(:author)
    end
  end

end
