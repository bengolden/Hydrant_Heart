require_relative '../spec_helper'

describe "Navbar Spec" do

  describe "Navbar should show on all pages" do

  	# routes = ["/", "/users/1", "/claims/1", "arguments/1"]

    it "should show the navigation on the home page" do
      visit '/'
      expect(page).to have_link("New Claim", :href => '/claims/new')
      expect(page).to have_link("New Argument", :href => '/arguments/new')
    end


    context 'When logged in' do
    	xit "should show profile and logout on home page" do
    		visit '/'
	    	# create session
	    	expect(page).to have_link('Profile', :href => "/users/#{current_user.id}")
	    	expect(page).to have_link('Logout', :href =>'/logout')
	    end
    end

    context 'When not logged in' do
    	xit "should show signup and login on home page" do
    		visit '/'
	    	expect(page).to have_link('Sign up', :href => '/signup')
	    	expect(page).to have_link('Login', :href => '/login')
	    end
    end

    it "should show the navigation on new user page" do
      visit '/users/new'
      expect(page).to have_link("New Claim", :href => '/claims/new')
      expect(page).to have_link("New Argument", :href => '/arguments/new')
    end


    context 'When logged in' do
    	xit "should show profile and logout on new user page" do
    		visit '/'
	    	# create session
	    	expect(page).to have_link('Profile', :href => "/users/#{current_user.id}")
	    	expect(page).to have_link('Logout', :href =>'/logout')
	    end
    end

    context 'When not logged in' do
    	xit "should show signup and login on new user page" do
    		visit '/'
	    	expect(page).to have_link('Sign up', :href => '/signup')
	    	expect(page).to have_link('Login', :href => '/login')
	    end
    end



  end
end