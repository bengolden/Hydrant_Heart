require_relative '../../spec_helper'


feature "users/create.html.erb" do
  it "has a create user page" do
    visit new_user_path
    expect(page).to have_content("Create a new user")
  end

  it "creates a new user with valid information" do
    visit new_user_path
    fill_in('Username', :with => 'duckling')
    fill_in('Email', :with => 'ugly@duckling.com')
    fill_in('Password', :with => 'password')
    fill_in('Image url', :with => 'http://curiousanimals.net/wp-content/uploads/2008/05/nice-duckling.jpg')
    expect {click_on('Create new user')}.to change(User, :count).by(1)
  end

  it "raises error with invalid information" do
    visit new_user_path
    fill_in('Email', :with => 'ugly@duckling.com')
    fill_in('Password', :with => 'password')
    fill_in('Image url', :with => 'http://curiousanimals.net/wp-content/uploads/2008/05/nice-duckling.jpg')
    expect {click_on('Create new user')}.to raise_error
    # expect {click_on('Create new user')}.not_to change(User, :count)
    # Should we add what error to expect here?
    # second part doesn't work here because error is thrown
  end




end

feature "users/login.html.erb" do

end

feature "users/destroy.html.erb" do

end

feature "users/update.html.erb" do

end
