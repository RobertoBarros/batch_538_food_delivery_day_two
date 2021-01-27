class Router
  def initialize(sessions_controller, meals_controller, customers_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
  end

  def run
    @employee = @sessions_controller.sign_in

    puts "-" * 80
    puts "User: #{@employee.username}"
    puts "-" * 80

    loop do
      if @employee.manager?
        print_actions_manager
        action = gets.chomp.to_i
        break if action == 99

        dispatch_manager(action)
      else
        print_actions_delivery_guy
        action = gets.chomp.to_i
        break if action == 99

        dispatch_delivery_guy(action)
      end
    end

    puts "Goodbye..."
  end

  private

  def print_actions_manager
    puts '-' * 80
    puts "1. Create Meal"
    puts "2. List Meal"
    puts '-' * 80
    puts "3. Create Customer"
    puts "4. List Customer"
    puts '-' * 80
    puts "5. Add new Order"
    puts "6. List all undelivered orders"
    puts '-' * 80
    puts 'Enter your action (99 to exit):'
    puts '-' * 80
  end

  def dispatch_manager(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @orders_controller.add
    when 6 then @orders_controller.list_undelivered_orders
    end
  end

  def print_actions_delivery_guy
    puts '-' * 80
    puts '1. Mark one of my orders as delivered'
    puts '2. List all my undelivered orders'
    puts '-' * 80
    puts 'Enter your action (99 to exit):'
    puts '-' * 80
  end

  def dispatch_delivery_guy(action)
    case action
    when 1 then @orders_controller.mark_as_delivered(@employee)
    when 2 then @orders_controller.list_my_orders(@employee)
    end
  end

end
