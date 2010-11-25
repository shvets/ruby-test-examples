# access_webapp_spec_spec.rb

require File.expand_path(File.dirname(__FILE__) + '/acceptance_spec_helper')

describe "access webapp" do

  context "searching" do
    before do
      visit "/"
      #      is_text_present("The Free Encyclopedia").should be_true
      #page.should have_content("The Free Encyclopedia")
    end

#    before do
#      fill_in "Search", :with => "akephalos"
#      click_button "Go"
#    end
    it "should submit the request" do
      fill_in "searchInput", :with => "iphone"
      click_button "→"
      page.should have_content("iPhone")
#
#      is_text_present("iPhone").should be_true
    end

#    it "returns results" { page.should have_css("#results") }
#    it "includes the search term" { page.should have_content("akephalos") }
  end

end

