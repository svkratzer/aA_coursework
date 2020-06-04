require 'tdd_test'

describe Array do

  describe "#my_uniq" do
    subject(:array) {[1, 1, 2, 2, 3, 3]}
    it "should take in an array" do
      expect { array.my_uniq }.to_not raise_error(NoMethodError)
    end
    it "should return a new array with no duplicate elements" do
      array2 = [4, 4, 5, 6]
      array3 = ["dog", "dog", "cat"]
      expect(array.my_uniq).to eq([1,2,3])
      expect(array2.my_uniq).to eq([4, 5, 6])
      expect(array3.my_uniq).to eq(["dog", "cat"])
    end
  end

  describe "#two_sum" do
    it "should take in an array"
    it "should return a new array"
    it "should add two elements and check sum equals zero"
    it "should make each pair have the smaller index before the larger"
  end

  describe "#my_transpose" do
    it "should take a 2D array"
    it "should return a new 2D array"
    it "should make each subarray contain elements of same index in original array"
  end

end

#---

describe "#stock_picker" do
    it "should take in an array of integers as arguments"
    it "should return an array"
    it "should an array where the first element is less than the second element"
    it "should return the max difference between an ele at a later idx and earlier idx"
end