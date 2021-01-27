class SessionsView

  def ask_username
    puts "Username?"
    gets.chomp
  end

  def ask_password
    puts "Password?"
    gets.chomp
  end

  def wrong_credentials
    puts "Wrong Credentials... Try again"
  end

  def welcome
    puts "Welcome to FOOD DELIVERY!"
  end

end
