require './lib/roman_convertor'

module MetalValue

  def create_metal_value_hash(metals, units_map)
    metals_roman = units_to_roman(metals, units_map)
    metals_credit(metals_roman)
  end

  private

  def units_to_roman(metals, units_map)
    metals_roman = []
    metals.each do |sentence|
      units_map.each {|k, v| sentence.gsub!(k, v)}
      metals_roman << sentence
    end
    metals_roman
    # ["I I Silver is 34 Credits",
   #"I V Gold is 57800 Credits",
   #"X X Iron is 3910 Credits"]
  end

  def metals_credit(metals_roman)
    #to create a hash with metal value of each unit
    metal_value_map = {}
    metals_roman.each do |sentence|
      arr = sentence.split(' ')
      roman_str = arr[0 .. -5].join('')
      metal = arr[-4]
      credit_value = arr[-2].to_f
      sum = RomanConvertor.convert_roman_to_arabic(roman_str)
      metal_value = credit_value / sum
      metal_value_map.merge!(metal => metal_value)
    end
    metal_value_map # {"Silver"=>17.0, "Gold"=>14450.0, "Iron"=>195.5}
  end
end

