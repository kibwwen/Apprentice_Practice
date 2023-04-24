class VendingMachine

  def initialize(maker)
    @maker = maker
    @coin = 0
  end

  def deposit_coin(coin)
    if coin
      @coin += coin
      puts "#{@coin}円です"
    end
  end
  
  def press_button

    puts 'sider'
  end

  def press_manufacturer_name
      puts @maker
  end

  private :press_manufacturer_name

end

class MerchandiseType
  
  def merchandise_type

  end
end

vending_machine = VendingMachine.new('サントリー')
vending_machine.press_button
begin  
  vending_machine.press_manufacturer_name
rescue => e
  puts "#{e.message} (#{e.class})"
end
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(150)