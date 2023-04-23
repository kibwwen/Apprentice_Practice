class Card
  require "debug"
  attr_reader :suit, :number

  SUITS = %w[♠ ♥ ♦ ♣]
  NUMBERS = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  
  def initialize(suit, number)
    @suit = suit
    @number = number
  end
end