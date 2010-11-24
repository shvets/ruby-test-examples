# access_webapp_spec.rb

require File.expand_path(File.dirname(__FILE__) + '/mechanize_spec_helper')

describe "access webapp" do
  it_should_behave_like "MechanizeTest"
  
  it "should submit the request" do
    # page = agent.get("http://www.google.com/")
    # #search_form = page.forms.with.name("f").first
    # search_form = page.forms.first
    # search_form.q = "Hello"
    # search_results = agent.submit(search_form)
    # puts search_results.body
    
    
    page = agent.get('http://rubyforge.org/')
    p page.links
    # link = page.links.first.text(/Log In/)
    # page = agent.click(link)
    # form = page.forms[1]
    # form.form_loginname = ARGV[0]
    # form.form_pw = ARGV[1]
    # page = agent.submit(form, form.buttons.first)
    # 
    # puts page.body
    
  end
  
end


