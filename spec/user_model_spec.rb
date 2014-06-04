require_relative 'spec_helper'


describe User do

  context "attributes" do
    it "has an attribute username" do
      should allow_value('ddeutsch').for(:username)
    end
    it "has an attribute email" do
      should allow_value('ddeutsch@book.com').for(:email)
    end
    it "has an attribute password stuff" do
      should allow_value('123fsadf45').for(:password)
    end
    it "has an attribute image_url" do
      should allow_value('http://www.image.com/20').for(:image_url)
    end
  end

  context "associations" do
    it "has many votes" do
      should have_many(:votes)
    end
    it "has many authored claims" do
      should have_many(:authored_claims).class_name('Claim').with_foreign_key(:author_id)
    end
    it "has many authored arguments" do
      should have_many(:authored_arguments).class_name('Argument').with_foreign_key(:author_id)
    end
  end
end
