=begin
The code below serves as a "brute force" method compared to the alternative that was actually used.
def generate_formatted_array(start, alphabet)              
  new_array = alphabet[start..-1] # creates a new array with elements starting from the given index
  temp_array = alphabet.dup # creates a copy of the original array to be used with shift later

  total_size = 26 # defines the maximum slot of the alphabet array, where shift can fill the gaps
  while new_array.size < total_size # takes the size of the new_array and fills it with elements from temp_array
    new_array << temp_array.shift # shift removes the first element of temp_array and adds it to the end of new_array
  end

  new_array # returns the new_array
end
=end

def generate_formatted_array(start, alphabet)
  alphabet.rotate(start)
end

def caesar_cipher(string, start)
  
  alphabet = ('a'..'z').to_a
  formatted_alphabet = generate_formatted_array(start, alphabet) # calls the function to generate a formatted array
  
  hashLetter = {}

  alphabet.each_with_index do |element1, index| # iterates over the alphabet and formatted_alphabet arrays
    element2 = formatted_alphabet[index] # takes the corresponding element from the formatted_alphabet
    hashLetter[element1] = element2
  end
  
  cc_str_array = []
  
  string.each_char do |char|
    if char =~ /[a-z]/ # Checks if it's a lowercase letter
      cc_str_array << hashLetter[char]
    elsif char =~ /[A-Z]/ # Checks if it's an uppercase letter
      lowercase_char = char.downcase
      cc_str_array << hashLetter[lowercase_char].upcase
    else
      cc_str_array << char # Keeps spaces, punctuation, and symbols unchanged
    end
  end

  cc_str_array.join

end

puts caesar_cipher("What a string!", 2)