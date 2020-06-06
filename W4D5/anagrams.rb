def generate_anagram(str) # ANAGRAM GENERATOR
  str.chars.shuffle.join
end

# --------------- FIRST --------------- 

def first_anagram?(str1, str2)
  permutations = str_permutations(str1)
  permutations.include?(str2)
end

def str_permutations(str)
  return [str] if str.length <= 1
  chars = str.chars
  first = chars.shift

  perms = str_permutations(chars.join)
  total_perms = []

  perms.each do |perm|
    (0..perm.length).each do |i|
      total_perms << (perm[0...i] + first + perm[i..-1])
    end
  end
  total_perms
end

# --------------- SECOND --------------- 

def second_anagram?(str1, str2)
  str1.each_char do |char|
    idx = str2.index(char)
    if idx.nil? 
      return false
    else
      str2[idx] = ""
    end
  end
  str2.empty?
end

# --------------- THIRD --------------- 

def third_anagram(str1, str2)
  str1.quick_sort_str == str2.quick_sort_str
end

def quick_sort_str(str)
  return str if str.length <= 1
  alpha = ("a".."z").to_a
  prc = Proc.new { |a,b,c| c.index(a) <=> c.index(b) }

  chars = str.chars
  pivot = chars.first

  left = chars.select { |char| prc.call(char, pivot, alpha) == -1 }
  right = chars.drop(1).select { |char| prc.call(char, pivot, alpha) >= 0 }

  quick_sort_str(left.join)+ pivot + quick_sort_str(right.join)
end

# --------------- FOURTH --------------- 

def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  str1.each_char { |char| hash1[char] += 1 }
  str2.each_char { |char| hash2[char] += 1 }
  hash1 == hash2
end

def bonus_anagram?(str1, str2)
  hash = Hash.new(0)
  str1.each_char { |char| hash[char] += 1 }
  str2.each_char { |char| hash[char] -= 1 }
  hash.all? { |k,v| v.zero? }
end


if __FILE__ == $PROGRAM_NAME

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
  # p second_anagram?(*test_1)
  # p second_anagram?(*test_2)
  # p second_anagram?(*test_3)
  # p second_anagram?(*test_4)
  # p second_anagram?(*test_5)
  # puts
  # p third_anagram?(*test_1)
  # p third_anagram?(*test_2)
  # p third_anagram?(*test_3)
  # p third_anagram?(*test_4)
  # p third_anagram?(*test_5)
  # puts
  # p fourth_anagram?(*test_1)
  # p fourth_anagram?(*test_2)
  # p fourth_anagram?(*test_3)
  # p fourth_anagram?(*test_4)
  # p fourth_anagram?(*test_5)

  p bonus_anagram?(*test_1)
  p bonus_anagram?(*test_2)
  p bonus_anagram?(*test_3)
  p bonus_anagram?(*test_4)
  p bonus_anagram?(*test_5)

end