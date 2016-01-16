require_relative 'player'

class Dealer < Player
  attr_reader :bets

  def initialize
    super("dealer", 0)

    @bets = {}
  end

  def place_bet(dealer, amt)
    raise "Dealer doesn't bet" if dealer.is_a?(Dealer)
  end

  def play_hand(deck)

  end

  def take_bet(player, amt)
    @bets[player] = amt
  end

  def pay_bets
    
  end
end
