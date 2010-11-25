# access_webapp_spec.rb

require File.expand_path('spec_helper', File.dirname(__FILE__))

Feature "Access web application" do
  Scenario "accessing" do
    Given "I am on the home page" do
      executes do
        visit "/"
        #page.should have_content('The Free Encyclopedia')
      end

      When "I submit a valid request" do
        executes do
          fill_in "searchInput", :with => 'iphone'
          click_button "→"
        end

        Then "I should see specific content" do
          page.should have_content('iPhone')
        end

        And "I should see something else" do
        end
      end
    end
  end
end
