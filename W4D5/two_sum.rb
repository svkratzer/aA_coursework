# ---------------- BRUTE FORCE ----------------

def bad_two_sum?(arr, target_sum)
  (0...arr.length).each do |i|
    (0...arr.length).each do |j|
      return true if i < j && arr[i] + arr[j] == target_sum
    end
  end
  false
end

# Time Complexity:  O(n^2)
# Space Complexity: O(1)

# ---------------- SORTING ----------------

def okay_two_sum?(arr, target_sum)
  sorted_arr = arr.sort
  sorted_arr.each_with_index do |ele, idx1|
    target = target_sum - ele
    new_arr = sorted_arr.dup
    new_arr.delete_at(idx1)
    idx2 = b_search(new_arr, target)
    return true unless idx2.nil?
  end
  false
end

def b_search(arr, target)
  return nil if arr.empty?
  mid = arr.length / 2
  case target <=> arr[mid]
  when 1
    result = b_search(arr.drop(mid+1), target)
    result.nil? ? nil : result + mid + 1
  when -1
    b_search(arr.take(mid), target)
  when 0
    return mid
  end
end

# ---------------- HASH MAP ----------------

def good_two_sum(arr, target)

end

if __FILE__ == $PROGRAM_NAME

arr = [0, 1, 5, 7]

p bad_two_sum?(arr, 6) # => true
p bad_two_sum?(arr, 10) # => false
puts
p okay_two_sum?(arr, 6) # => true
p okay_two_sum?(arr, 10) # => false
puts
p good_two_sum?(arr, 6) # => true
p good_two_sum?(arr, 10) # => false
puts
p b_search(arr.sort, 7)

end