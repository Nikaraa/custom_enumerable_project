module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    for el in self
      yield el, i
      i += 1
    end
    self
  end

  def my_select(&block)
    case self
    when Array
      array = []
      self.my_each { |i| array.push(i) if block.call(i) }
      array
    when Hash
      hash = {}
      self.my_each { |k, v| hash[k] = v if block.call(k, v) }
      hash
    end
  end

  def my_all?
    my_each { |e| return false unless yield e }
    return true
  end

  def my_any?
    my_each { |e| return true if yield e }
    return false
  end

  def my_none?
    my_each { |e| return false if yield e }
    return true
  end

  def my_count
    return length unless block_given?
    count = 0
    my_each { |e| count += 1 if yield e }
    count
  end

  def my_map(&block)
    array = []
    i = 0
    while i < self.length
      array[i] = block.call(self[i])
      i += 1
    end
    array
  end

  def my_inject(initial_value)
    init = initial_value
    my_each { |e| init = (yield init, e) }
    init
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for el in self
      yield el
    end
  end
end
