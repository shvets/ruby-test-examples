require 'rubygems' unless RUBY_VERSION =~ /1.9.*/

require 'rubygems'
require 'mechanize'

share_examples_for :MechanizeTest do
  attr_reader :agent

  before :all do
    @verification_errors = []

    @agent = Mechanize.new
    @agent.user_agent_alias = 'Mac Safari'
  end

  before :each do
  end

  append_after :each do
    @verification_errors.should == []
  end

end