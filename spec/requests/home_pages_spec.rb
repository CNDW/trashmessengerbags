require 'spec_helper'

describe "HomePages" do
  describe "GET /home" do
    it "should have the content 'Photo Slideshow'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/home'
      expect(page).to have_content('Photo Slideshow')
    end
    it "should have the title 'Home'" do
    	visit '/home'
    	expect(page).to have_title('Home')
    end
  end

  describe "GET /blog" do
  	it "should have the content 'Blog'" do
  		visit '/blog'
  		expect(page).to have_content('Blog')
  	end
  	it "should have the title 'Blog'" do
  		visit '/blog'
  		expect(page).to have_title('Blog')
  	end
  end
end
