require 'rubygems' unless RUBY_VERSION =~ /1.9.*/

require 'java' if RUBY_PLATFORM =~ /java/

require 'capybara'
require "capybara/dsl"
require 'akephalos'
require "rspec"

RSpec.configure do |config|
  config.include Capybara
end

config = {
  'application_address' => 'www.wikipedia.org',
  'application_port' => '80',
  'application_name' => ''
}

webapp_url = "http://#{config['application_address']}:#{config['application_port']}/#{config['application_name']}"

puts "Application: #{webapp_url}"

Capybara.app_host = webapp_url

Capybara.default_wait_time = 5

if RUBY_PLATFORM =~ /java/
  Capybara.current_driver = :celerity
  Capybara.javascript_driver = :culerity
else
  Capybara.current_driver = :selenium
  Capybara.javascript_driver = :Akephalos

#  Capybara.default_selector = :css
end
