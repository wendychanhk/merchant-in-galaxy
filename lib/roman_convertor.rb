module RomanConvertor
  def self.convert_roman_to_arabic(roman_str)
    #to convert roman characters to integer by iterating the hash from largest value and check if the given roman string has 
    # the roman key. Accumulate the matching value and return the value of the roman str (sum)  
    sum = 0
    roman_arabic_map = {
        "I" => 1,
        "IV"=> 4,
        "V" => 5,
        "IX" => 9,
        "X" => 10,
        "XL" => 40,
        "L" => 50,
        "XC" => 90,
        "C"=> 100,
        "CD" => 400,
        "D" => 500,
        "CM"=> 900,
        "M"=> 1000
    }
    roman_arabic_map.values.reverse.each do |value|
      subset = 0
        while roman_str.start_with?roman_arabic_map.key(value)
          subset += value
          roman_str.slice!(roman_arabic_map.key(value))
        end
      sum += subset
    end
    sum
  end
end
