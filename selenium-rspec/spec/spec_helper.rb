require 'rubygems' unless RUBY_VERSION =~ /1.9.*/

require "selenium/client"

require File.dirname(__FILE__) + "/selenium_dsl"
SeleniumScript.send :include, RSpec::Matchers

config = {
  'application_address' => 'www.wikipedia.org',
  'application_port' => '80',
  'application_name' => '',
  'selenium_server_address' => 'localhost',
  'selenium_server_port' => '4444',
  'selenium_browser_key' => '*firefox',
}

webapp_url = "http://#{config['application_address']}:#{config['application_port']}/#{config['application_name']}"

puts "Application: #{webapp_url}"
puts "Selenium: #{config['selenium_server_address']}:#{config['selenium_server_port']}"


RSpec.configuration.include(Selenium::DSL)

module Selenium::Client::Base
  alias originalInitialize initialize

  def initialize(*args)
    originalInitialize *args

    @highlight_located_element_by_default = true
  end
end

share_examples_for :SeleniumTest do
  before :all do
    init_selenium(config['selenium_server_address'], config['selenium_server_port'].to_i,
                  config['selenium_browser_key'], webapp_url, 30)
  end

  before :each do
    start_new_session
  end

  after :each do
    close_session
  end
end


