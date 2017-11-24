#take word as first argument
#then takes array of valid substrings as second argument
#returns hash listing each substring and how many times found

def split_word s
  indices = (0...s.length).to_a
  variations = indices.product(indices).reject{| i,j | i > j}.map{| i,j | s[i..j]}.uniq
  return variations
end

def string_cleanup(string)
  alt_string = ""
  string.each_char do |x|
    if x =~ /[a-zA-Z]/
      alt_string += x
    end
  end
end

def substrings(string, dictionary)
  hash_list = Hash.new(0)
  string = string.split(" ")
  puts string.inspect
  string.each do |element|
    element = string_cleanup(element)
    elements = split_word(element)
    elements.each do |x|
      if dictionary.index(x.downcase) != nil
        hash_list[x] += 1;
      end
    end
  end
  return hash_list
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
