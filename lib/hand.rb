class Hand
  # This is called a *factory method*; it's a *class method* that
  # takes the a `Deck` and creates and returns a `Hand`
  # object. This is in contrast to the `#initialize` method that
  # expects an `Array` of cards to hold.
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    point = 0
    aces = 0
    @cards.each do |card|
      if card.value == :ace
        point += 11
        aces += 1
      else
        point += card.blackjack_value
      end
    end

    aces.times do
      point -= 10 if point > 21
    end

    point
  end

  def busted?
    return true if points > 21
    false
  end

  def hit(deck)
    if busted?
    raise "already busted"
    else
    @cards = deck.take(1) + @cards
    end
  end

  def beats?(other_hand)
    return false if busted?
    return false if points < other_hand.points && !other_hand.busted?
    return false if points == other_hand.points
    true
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
