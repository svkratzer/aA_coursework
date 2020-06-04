class Array
  def my_uniq
    hash = Hash.new
    self.each { |ele| hash[ele] = true }
    hash.keys
  end
end