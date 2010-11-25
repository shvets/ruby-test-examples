require 'rubygems' unless RUBY_VERSION =~ /1.9.*/

require 'rspec'

require 'unencumbered'
require 'capybara'
require "capybara/dsl"

RSpec.configuration.include Capybara

Capybara.app_host = "http://www.wikipedia.org"
Capybara.current_driver = :culerity

