class Deck
  require 'debug'
  require_relative "card"

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::NUMBERS.each do |number|
        @cards << Card.new(suit, number)
      end
    end
    @cards.shuffle!
  end

  def draw(num)
    @cards.pop(num)
  end

end