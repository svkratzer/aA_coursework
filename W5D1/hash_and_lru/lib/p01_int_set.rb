require "set"

class MaxIntSet
  attr_reader :store, :max

  def initialize(max)
    @store = Array.new(max, false)
    @max = max
  end
  
  def insert(num)
    raise "Out of bounds" unless num.between?(0, self.max - 1)
    self.store[num] = true
  end

  def remove(num)
    self.store[num] = false
  end

  def include?(num)
    self.store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    i = num % @store.length
    @store[i] << num unless self.include?(num)
  end

  def remove(num)
    self[num].delete(num) if self.include?(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    i = num % @store.length
    @store[i]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    i = num % @store.length
    unless self.include?(num)
      @store[i] << num 
      self.count += 1 
    end
    resize! if self.count > num_buckets
  end

  def remove(num)
    if self.include?(num)    
      self[num].delete(num) 
      self.count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    i = num % @store.length
    @store[i]
  end

  def num_buckets
    @store.length
  end

  def resize!
    existing_eles = self.store.dup.flatten
    new_length = num_buckets * 2
    self.store = Array.new(new_length) { Array.new }
    self.count = 0
    existing_eles.each { |ele| self.insert(ele) }
  end
end

if __FILE__ == $PROGRAM_NAME

  set = ResizingIntSet.new
  p set.store.length * 2
  p set.store
end
