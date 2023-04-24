class Player
  require "debug"
  attr_reader :name, :cards

  def initialize(name)
    @name = name
    @cards = []
    @total = []
  end

  def draw(deck, num)
    cards = deck.draw(num)
    @cards = cards
  end

  def add_card(deck)
    @cards << deck
  end

  def total
    @total = @cards.to_a.sum{|card| 
      case card.number
      when 'J'
        11
      when 'Q'
        12
      when 'K'
        13
      when 'A'
        1
      else
        card.number.to_i
      end
    }
  end

  def a_judge
    @cards.each do |card|
      if card.number == 'A'
        if total + 10 > 21
          return total
        else
          return total + 10
        end
      else
        return total
      end
    end
  end
end