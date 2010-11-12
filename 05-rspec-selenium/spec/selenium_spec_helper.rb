require 'rubygems' unless RUBY_VERSION =~ /1.9.*/
  
require File.dirname(__FILE__) + "/selenium_client_helper"
# require "selenium/client"
# require "selenium/rspec/spec_helper"
require 'yaml'

env_name = 'development'
config_name = env_name

config = YAML.load_file(File.expand_path(File.dirname(__FILE__) + '/selenium.yml'))[config_name]

webapp_url = "http://#{config['application_address']}:#{config['application_port']}/#{config['application_name']}"

puts "Application: #{webapp_url}"
puts "Selenium Configuration: #{config_name}"
puts "Selenium: #{config['selenium_server_address']}:#{config['selenium_server_port']}"

share_examples_for :SeleniumTest do
  attr_reader :selenium_driver
  alias :page :selenium_driver

  before :all do
    @verification_errors = []

    @selenium_driver = Selenium::Client::Driver.new \
      :host => config['selenium_server_address'],
      :port => config['selenium_server_port'].to_i,
      :browser => config['selenium_browser_key'],
      :url => webapp_url,
      :timeout_in_second => 60
  end

  before :each do
    @selenium_driver.start_new_browser_session
  end

  append_after :each do
    @selenium_driver.close_current_browser_session
    @verification_errors.should == []
  end

end
