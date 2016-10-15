require './rpn_calc'

puts "Can't wait for your task in Reverse Polish annotation:"
text = gets.chomp
calculator = RPN_calc.new
puts calculator.calc(text)

