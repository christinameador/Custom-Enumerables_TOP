# frozen_string_literal: true

require_relative 'custom_enums'

example = [1, 2, 3, 4, 5]

puts 'my_each vs each'
puts 'Good call with #my_each:'
example.my_each { |item| puts item }
puts 'And now #my_each witohout block :'
example.my_each
puts ''
puts 'Original #each:'
example.each { |item| puts item }
puts '--------------------'

puts 'my_each_with_index vs each_with_index'
puts 'my_each_with_index'
example.my_each_with_index { |item, index| puts "#{item} has index #{index}" }
puts ''
puts 'Original #each_with_index'
example.each_with_index { |item, index| puts "#{item} has index #{index}" }
puts '--------------------'

puts 'my_select vs select'
puts '#my_select: elements < 3'
puts(example.my_select { |item| item < 3 })
puts '#my_select without block'
puts example.my_select
puts ''
puts 'Original #select'
puts(example.select { |item| item < 3 })
puts '--------------------'

puts 'my_all? vs all?'
puts '#my_all?: elements < 3'
puts(example.my_all? { |item| item < 3 })
puts '#my_all? elements < 6'
puts(example.my_all? { |item| item < 6 })
puts ''
puts 'Original #all?: elements < 3'
puts(example.all? { |item| item < 3 })
puts 'Original #all?: elements < 6'
puts(example.all? { |item| item < 6 })
puts '--------------------'

puts 'my_any? vs any?'
puts '#my_any?: elements < 3'
puts(example.my_any? { |item| item < 3 })
puts '#my_any?: elements > 6'
puts(example.my_any? { |item| item > 6 })
puts '#my_any?: elements == 1'
puts(example.my_any? { |item| item == 1 })
puts ''
puts 'Original any?: elements < 3'
puts(example.any? { |item| item < 3 })
puts 'Original any?: elements > 6'
puts(example.any? { |item| item > 6 })
puts 'Original any?: elements == 1'
puts(example.any? { |item| item == 1 })
puts '--------------------'

puts 'my_none? vs none?'
puts '#my_none?: elements < 3'
puts(example.my_none? { |item| item < 3 })
puts '#my_none?: elements > 6'
puts(example.my_none? { |item| item > 6 })
puts ''
puts 'Original #none?: elements < 3'
puts(example.none? { |item| item < 3 })
puts 'Original #none?: elements > 6'
puts(example.none? { |item| item > 6 })
puts '--------------------'

puts 'my_count? vs count'
puts '#my_count?: elements < 4'
puts(example.my_count { |item| item < 4 })
puts '#my_count?: elements > 6'
puts(example.my_count { |item| item > 6 })
puts '#my_count? without a block'
puts example.my_count
puts '#my_count?: argument given'
puts example.my_count(2)
puts ''
puts 'Original #count?: elements < 4'
puts(example.count { |item| item < 4 })
puts 'Original #count?: elements > 6'
puts(example.count { |item| item > 6 })
puts 'Original #count? without a block'
puts example.count
puts 'Original #count?: argument given'
puts example.count(2)
puts '--------------------'

puts 'my_map vs map'
puts '#my_map without a block'
puts example.my_map
puts '#my_map: elements * 3'
puts(example.my_map { |item| item * 3 })
puts ''
puts 'Original #map: elements * 3'
puts(example.map { |item| item * 3 })
puts '--------------------'

puts '#my_map_with_proc takes a proc'
proc = proc { |item| item + 2 }
puts example.my_map_with_proc proc
puts '--------------------'

puts '#my_map_with_proc_or_block takes the same proc'
puts example.my_map_with_proc_or_block proc
puts '#my_map_with_proc_or_block takes the same block'
puts(example.my_map_with_proc_or_block { |item| item + 2 })
puts '--------------------'

puts 'my_inject vs inject'
puts '#my_inject: sum of elements'
puts(example.my_inject { |sum, item| sum + item })
puts ''
puts 'Original #inject: sum of elements'
puts(example.inject { |sum, item| sum + item })
puts ''
puts '#my_inject acting inside a method'
puts multiply_els([2, 4, 5])
puts ''
puts 'Original #inject acting inside a method'
puts([2, 4, 5].inject { |result, item| result * item })
puts '--------------------'
