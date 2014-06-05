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

    before :each do
      @rocky = User.create!(username: "rocky", email: "rocky@email.com", password: "password", image_url: "http://dogcarers.com/wp-content/uploads/2014/02/westies-dog-breed2.jpg")
    end

    describe "#password=" do
      specify "should return a BCrypt::Password" do
        expect(@rocky.password).to be_an_instance_of(BCrypt::Password)
      end
    end
  end

  describe "Comparing a hashed password with a secret" do
    before :each do
      @secret = "U*U"
      @hash = "$2a$05$CCCCCCCCCCCCCCCCCCCCC.E5YPO9kmyuRGyh0XouQYb4YMJKvyOeW"
      @password = BCrypt::Password.create(@secret)
      @rocky = User.create!(username: "rocky", email: "rocky@email.com", password: @secret, image_url: "http://dogcarers.com/wp-content/uploads/2014/02/westies-dog-breed2.jpg")
    end

    specify "should compare successfully to the original secret" do
      expect(@rocky.password == @secret).to be(true)
    end

    specify "should compare unsuccessfully to anything besides original secret" do
      expect(@rocky.password == "@secret").to be(false)
    end

    specify "password_hash should be a hash" do
      expect(@rocky.password_hash).to be_an_instance_of(BCrypt::Password)
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
