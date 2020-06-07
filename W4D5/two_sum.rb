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



if __FILE__ == $PROGRAM_NAME

arr = [0, 1, 5, 7]

p bad_two_sum?(arr, 6) # => true
p bad_two_sum?(arr, 10) # => false
puts
p bad_two_sum?(arr, 6) # => true
p bad_two_sum?(arr, 10) # => false
puts


end