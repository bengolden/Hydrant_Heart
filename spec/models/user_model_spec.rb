require_relative '../spec_helper'


describe User do

  context "attributes" do
    it "has an attribute username" do
      should allow_value('ddeutsch').for(:username)
    end
    it "has an attribute email" do
      should allow_value('ddeutsch@book.com').for(:email)
    end
    it "has an attribute password" do
      should allow_value('123fsadf45').for(:password)
    end
    it "has an attribute image_url" do
      should allow_value('http://www.image.com/20').for(:image_url)
    end
  end

  context "bcrypt password methods" do
    let!(:rocky) { User.create(username: "rocky", email: "rocky@email.com", password: "password", image_url: "http://dogcarers.com/wp-content/uploads/2014/02/westies-dog-breed2.jpg")}
    it "alters password before storing in database" do
      #expect to return a long string not same as entered password
      expect(rocky.password.to_s).not_to eq("password")
    end

    it "compares given password to stored password hash properly" do
      expect(rocky.password_hash.inspect).to eq(rocky.password.inspect)
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

  context "validations:" do
    it "username should not be empty" do
      should validate_presence_of(:username)
    end

    it "email should not be empty" do
      should validate_presence_of(:email)
    end

    it "username should be a unique value" do
      should validate_uniqueness_of(:username)
    end

    it "email should be a unique value" do
      should validate_uniqueness_of(:email)
    end

    it "email should be a legitimate format" do
      should allow_value('jus23-tin@gmail.com', 'b@v9.au').
      for(:email).
      with_message('Improper email format')
    end
  end
end
