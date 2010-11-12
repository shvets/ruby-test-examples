# user.rb

class User
  attr_accessor :username, :password, :email

  USERS = { 'jdoe' => {:password => 'correct', :email => 'name@url.com', :logged_in => false}}

  def initialize username, password, email = nil
    @username = username
    @password = password
    @email = email

    USERS[username] = { :password => password, :email => email }
  end

  def self.find_by_username username
    USERS[username]
  end

  def login
    user = USERS[@username]
    
    if user[:password] == @password
      user[:logged_in] = true
      true
    else
      false
    end
  end

  def logout
    USERS[@username][:logged_in] = false
  end
  
  def logged_in?
    user = USERS[@username]
    
    user[:logged_in]
  end

end
