require_relative 'card'

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def self.all_cards
    cards = []
    4.times do |suit|
      13.times do |value|
        cards << Card.new(Card.suits[suit], Card.values[value])
      end
    end
    cards
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    @cards.size
  end

  # Takes `n` cards from the top of the deck.
  def take(n)

    if n > count
      raise "not enough cards"
    else
      @cards.shift(n)
    end

  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    @cards += cards
  end
end
