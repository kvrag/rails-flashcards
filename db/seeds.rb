require 'parser'

# Reading all text files in decks folder to build flashcard decks out of.
Dir.foreach('./db/decks') do |file|
  next if file == '.' || file == '..' || file =='.DS_Store'
  deck = Deck.create(name: file[0...-4].split('_').join(' ').capitalize)
  cards = Parser.parse("./db/decks/#{file}")

  cards.each do |card|
    new_card = Card.new(card)
    new_card.deck = deck
    new_card.save
  end
end

# guest user
guest = User.create(email: "guest@guest.com", password: "guest")

# Creating a user/round test association. User 1 "tom" (tom@tom.com) guesses all cards correctly on the first try.
deck = Deck.first
user1 = User.create(email: "tom@tom.com", password: "tomtom")
round1 = Round.new
round1.user = user1
round1.deck = deck

deck.cards.each do |card|
  guess = Guess.new
  guess.card = card
  round1.guesses << guess
  guess.save
end
round1.save

# Creating a user/round test association. User 2 "bill" (bill@bill.com) guesses incorrectly 3 times.
user2 = User.create(email: "bill@bill.com", password: "billbill")
round2 = Round.new
round2.user = user2
round2.deck = deck

deck.cards.each do |card|
  guess = Guess.new
  guess.card = card
  round2.guesses << guess
  guess.save
end

3.times do
  guess = Guess.new(card: deck.cards.sample)
  round2.guesses << guess
  guess.save
end
round2.save
