# access_webapp_spec.rb

require File.expand_path(File.dirname(__FILE__) + '/acceptance_spec_helper')

describe "access webapp" do
  it_should_behave_like :SeleniumTest do

    it "should submit the request" do
      selenium do
        open "/"

        is_text_present("The Free Encyclopedia").should be_true

        type "searchInput", "iphone"

        click "go", :wait => true

        is_text_present("iPhone").should be_true
      end

    end
  end
end
