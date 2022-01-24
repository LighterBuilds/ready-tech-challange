require_relative 'basket'
require_relative 'product'

puts '--------'
puts 'Output 1'
puts '--------'

book = Product.new('Book', 12.49, 'Book')
music_cd = Product.new('music cd', 14.99, 'music cd')
bar = Product.new('chocolate bar', 0.85, 'food')

basket1 = Basket.new
basket1.add_product(book)
basket1.add_product(music_cd)
basket1.add_product(bar)

puts basket1.print_receipt

puts '--------'
puts 'Output 2'
puts '--------'
imported_chocolate1 = Product.new('imported box of chocolates', 10.00, 'food', true)
imported_perfume1 = Product.new('imported bottle of perfume', 47.50, 'perfume', true)

basket2 = Basket.new
basket2.add_product(imported_chocolate1)
basket2.add_product(imported_perfume1)

puts basket2.print_receipt

puts '--------'
puts 'Output 3'
puts '--------'
imported_perfume2 = Product.new('imported bottle of perfume', 27.99, 'perfume', true)
perfume_local = Product.new('bottle of perfume', 18.99, 'perfume')
headache_pills = Product.new('packet of headache pills', 9.75, 'medication')
imported_chocolate2 = Product.new('box of imported chocolates', 11.25, 'food', true)

basket3 = Basket.new
basket3.add_product(imported_perfume2)
basket3.add_product(perfume_local)
basket3.add_product(headache_pills)
basket3.add_product(imported_chocolate2)

puts basket3.print_receipt
