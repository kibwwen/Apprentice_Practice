require 'debug'
require_relative "deck"
require_relative "player"

class Game
  def initialize
    @deck = Deck.new
    @user = Player.new("あなた")
    @dealer = Player.new("ディーラー")
  end

  def play
    puts "ブラックジャックを開始します。"
    @user.draw(@deck, 2)
    @dealer.draw(@deck, 2)

    @user.cards.each do |card|
      puts "#{@user.name}の引いたカードは#{card.suit}#{card.number}です。"
      end
      u_value = @user.a_judge
      if u_value > 21
        puts "#{@user.name}の現在の得点は#{u_value}です。"
        puts "#{@user.name}の負けです。"
        exit
      end

    2.times do |num|
      num += 1
      case num
      when 1
        puts "#{@dealer.name}の引いたカードは#{@dealer.cards[num - 1].suit}#{@dealer.cards[num - 1].number}です。"
      when 2
        puts "#{@dealer.name}の引いた#{num}枚目のカードは分かりません。"
      end
    end

    u_value = @user.a_judge
    while u_value <= 21
      u_value = @user.a_judge
      puts "#{@user.name}の現在の得点は#{u_value}です。カードを引きますか？（Y/N)"
      answer = gets.chomp
      if answer == 'y'
        @user.add_card(@deck.draw(1)).flatten!
        num = @user.cards.count
        puts "#{@user.name}の引いたカードは#{@user.cards[num-1].suit}#{@user.cards[num-1].number}です"
        u_value = @user.a_judge
        if u_value > 21
          puts "#{@user.name}の現在の得点は#{u_value}です。"
          puts "#{@user.name}の負けです。"
          exit
        end
      elsif answer == 'n'
        break
      end
    end
    
    d_value = @dealer.total
    puts "#{@dealer.name}の２枚目のカードは#{@dealer.cards[1].suit}#{@dealer.cards[1].number}"
    puts "#{@dealer.name}の現在の得点は#{d_value}です。"
    while d_value < 17
      @dealer.add_card(@deck.draw(1)).flatten!
      num = @dealer.cards.count
      puts "#{@dealer.name}の引いたカードは#{@dealer.cards[num-1].suit}#{@dealer.cards[num-1].number}です。"
      d_value = @dealer.total
      puts "#{@dealer.name}の得点は#{d_value}"
    end
    if d_value > 21
      puts "#{@user.name}の勝ちです！"
      exit
    elsif d_value >= 17
      if u_value > d_value
        puts "#{@user.name}の勝ちです！"
      elsif u_value < d_value
        puts "#{@user.name}の負けです！"
      else
        puts "引き分けです！"
      end
    end
  end

end