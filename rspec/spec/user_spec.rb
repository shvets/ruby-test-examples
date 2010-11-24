# user_spec.rb

require "rspec"

require 'user'

describe User do
  context "login" do
    subject { User.new "name", "password" }
   
      it "should be logged in" do
        subject.login
        subject.logged_in?.should be_true
      end
    

    it "should be logged out" do
        subject.logout 
        subject.logged_in?.should be_false
    end
  end
end

