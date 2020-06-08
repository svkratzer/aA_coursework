class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return 0 if self.empty?
    self.inject { |acc, num| acc ^ num * self.index(num) }
  end
end

class String
  def hash
    alpha = [*("a".."z"), *("A".."Z")]
    hash = alpha.index(self[0])
    self[1..-1].each_char.with_index do |char, i|
      idx = alpha.index(char)
      hash = hash ^ idx * i
    end
    hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    return 0 if self.empty?
    alpha = [*("a".."z"), *("A".."Z")]
    hash = self.keys.first.to_s.hash ** (self.values.first.hash + 1)
    return hash if self.length == 1
    self.drop(1).each do |k,v|
      key = k.to_s
      hash = hash ^ (key.hash ** (v.hash + 1))
    end
    hash
  end
end

if __FILE__ == $PROGRAM_NAME

  p [0,1,2,3,4].hash

end