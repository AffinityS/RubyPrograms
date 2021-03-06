def calculate_total(cards) 
  arr = cards.map{|e| e[1] }

  total = 0
  arr.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end
  arr.select{|e| e == "A"}.count.times do
    total -= 10 if total > 21
  end

  total
end

puts "Welcome to Blackjack!"

suits = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = suits.product(cards)
deck.shuffle!

mycards = []
dealercards = []


mycards << deck.pop
dealercards << deck.pop
mycards << deck.pop
dealercards << deck.pop


dealertotal = calculate_total(dealercards)
mytotal = calculate_total(mycards)

puts "The dealer has #{dealercards[0]} and #{dealercards[1]}, for a total of #{dealertotal}"
puts "You have #{mycards[0]} and #{mycards[1]}, for a total of #{mytotal}"
puts ""