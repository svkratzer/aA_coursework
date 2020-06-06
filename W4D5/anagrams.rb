def generate_anagram(str)
  str.chars.shuffle.join
end



def first_anagram?(str1, str2)
  permutations = str_permutations(str)
end

def str_permutations(str)
  return [str] if str.length <= 1
  chars = str.chars
  first = chars.shift

  perms = str_permutations(chars.join)
  total_perms = []

  perms.each do |perm|
    (0...perm.length).each do |i|
      total_perms << perm[0...i] + first + perm[i..-1]
    end
  end
  total_perms
end

if __FILE__ == $PROGRAM_NAME

# p generate_anagram("hello")
# p generate_anagram("loquacious")
# p generate_anagram("supercalifragilisticexpialidocious")

test_1 = ["hello", "llohe"]
test_2 = ["loquacious", "cuoqoulsai"]
test_3 = ["supercalifragilisticexpialidocious", "geosiupitiecfsisildalaxpuiorclcrai"]
test_4 = ["ion", "eon"]
test_5 = ["hello", "goodbye"]

# p first_anagram?(*test_1)
# p first_anagram?(*test_2)
# p first_anagram?(*test_3)
# p first_anagram?(*test_4)
# p first_anagram?(*test_5)
# puts
# p b_anagram?(*test_1)
# p b_anagram?(*test_2)
# p b_anagram?(*test_3)
# p b_anagram?(*test_4)
# p b_anagram?(*test_5)
# puts
# p c_anagram?(*test_1)
# p c_anagram?(*test_2)
# p c_anagram?(*test_3)
# p c_anagram?(*test_4)
# p c_anagram?(*test_5)
# puts
# p d_anagram?(*test_1)
# p d_anagram?(*test_2)
# p d_anagram?(*test_3)
# p d_anagram?(*test_4)
# p d_anagram?(*test_5)

p str_permutations("hello")
p str_permutations("he")
p str_permutations("h")
p str_permutations("")

end