# access_webapp_spec.rb

require File.expand_path(File.dirname(__FILE__) + '/selenium_spec_helper')

describe "access webapp" do
  it_should_behave_like "SeleniumTest"
  
  it "should submit the request" do
    page.open "/"

    page.is_text_present("The Free Encyclopedia").should be_true

    page.type "searchInput", "iphone"
    
    page.click "go", :wait => true

    page.is_text_present("iPhone").should be_true
  end
  
end
