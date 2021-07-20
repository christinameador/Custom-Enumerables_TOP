# frozen_string_literal: true

# Let's add our methods to the existing module Enumerable
module Enumerable
  def no_block_given
    puts 'WARNINNG! No block was given. Generic enumerator was returned.'
    to_enum
  end

  # No .each allowed so let's create our own!
  def my_each
    return no_block_given unless block_given?

    for item in self
      yield item
    end
  end

  def my_each_with_index
    return no_block_given unless block_given?

    index = 0
    # No .each allowed!
    for item in self
      yield item, index
      index += 1
    end
  end

  def my_select
    return no_block_given unless block_given?

    data = []
    my_each { |item| data.push item if yield item }
    data
  end

  def my_all?
    return no_block_given unless block_given?

    my_each do |item|
      return false unless yield item
    end
    true
  end

  def my_any?
    return no_block_given unless block_given?

    my_each do |item|
      return true if yield item
    end
    false
  end

  def my_none?
    return no_block_given unless block_given?

    my_each do |item|
      return false if yield item
    end
    true
  end

  def my_count(obj = nil)
    counter = 0
    if block_given?
      my_each do |item|
        counter += 1 if yield item
      end
    elsif obj.nil?
      counter = self.length
    else
      my_each do |item|
        counter += 1 if item == obj
      end

    end
    counter
  end

  # Original my_map
  def my_map
    return no_block_given unless block_given?

    result = []
    my_each do |item|
      result << yield(item)
    end
    result
  end

  # Modified my_map, which takes a proc
  def my_map_with_proc(proc)
    # return no_block_given unless block_given?

    result = []
    my_each do |item|
      result << proc.call(item)
    end
    result
  end

  # Once more modified my_map to take either block or proc
  def my_map_with_proc_or_block(proc = nil)
    result = []
    if block_given?
      my_each do |item|
        result << yield(item)
      end
    else
      my_each do |item|
        result << proc.call(item)
      end
    end
    result
  end

  def my_inject
    return no_block_given unless block_given?

    result = self[0]
    # Skip firs element
    drop(1).my_each do |item|
      result = yield(result, item)
    end
    result
  end
end

# Just to demonstrate our #my_inject behavior inside of a method
def multiply_els(arr)
  arr.my_inject { |result, item| result * item }
end
