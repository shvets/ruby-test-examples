require 'rubygems' unless RUBY_VERSION =~ /1.9.*/

require "selenium/client"
require 'yaml'

require File.dirname(__FILE__) + "/selenium_dsl"

env_name = 'development'
config_name = env_name

config = YAML.load_file(File.expand_path(File.dirname(__FILE__) + '/selenium.yml'))[config_name]

webapp_url = "http://#{config['application_address']}:#{config['application_port']}/#{config['application_name']}"

puts "Application: #{webapp_url}"
puts "Selenium Configuration: #{config_name}"
puts "Selenium: #{config['selenium_server_address']}:#{config['selenium_server_port']}"

Spec::Runner.configuration.include(Selenium::DSL)

share_examples_for :SeleniumTest do
  before :all do
    init_selenium(config['selenium_server_address'], config['selenium_server_port'].to_i,
                  config['selenium_browser_key'], webapp_url, 30)
  end

  before :each do
    start_new_session
  end

  append_after :each do
    close_session
  end
end

module Selenium::Client::Base
  alias originalInitialize initialize

  def initialize(*args)
    originalInitialize *args

    @highlight_located_element_by_default = true
  end
end

