require "byebug"

def my_min_1(list)
  min = nil
  list.each do |num|
    min = num
    new_list = list.dup
    new_list.delete(num)
    return min if new_list.none? { |n| n < min }
  end
end

def my_min_2(list)
  list.inject { |acc, num| num < acc ? num : acc }
end

def largest_contiguous_subsum_1(list)
  subsets = subsets(list)
  subsets.map(&:sum).max
end

def subsets(arr)
  l = arr.length - 1
  subsets = []
  (0..l).each do |idx1|
    (0..l).each do |idx2|
      subsets << arr[idx1..idx2] if idx1 <= idx2
    end
  end
  subsets
end

def largest_contiguous_subsum_2(list)
  max_sum = list.first
  sum = max_sum

  list.drop(1).each do |num|
    sum = 0 if sum < 0
    sum += num
    max_sum = sum if sum > max_sum
  end
  max_sum
end

if __FILE__ == $PROGRAM_NAME

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]
list4 = [5, 3, -7]

p my_min_1(list)
p my_min_2(list)
puts
p largest_contiguous_subsum_1(list2)
p largest_contiguous_subsum_1(list3)
p largest_contiguous_subsum_1(list4)
puts 
p largest_contiguous_subsum_2(list2)
p largest_contiguous_subsum_2(list3)
p largest_contiguous_subsum_2(list4)
end

