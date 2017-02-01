require './lib/roman_convertor'

module MetalsQuestions
  def answers_to_questions_metals(questions_credits, units_map, metal_value_hash)
    cut_str = cut_string(questions_credits)
    metals_questions_to_answers(cut_str, units_map, metal_value_hash)
  end

  private

  def answers_to_questions_units(questions_units, units_map)
    result = []
    #@questions_units ["how much is pish tegj glob glob ?"]
    questions_units.each do |q|
      result << extract(q) + " is " + units_questions_to_answers(extract(q), units_map).to_s
    end
    result
  end

  def units_questions_to_answers(extraction, units_map)
    #units_map = {"glob"=>"I", "prok"=>"V", "pish"=>"X", "tegj"=>"L"}
    #loop through units_map for converting the galaxy units to roman string 
    #then calling the RomanConvertor to convert the roman string to integer 
    units_map.each {|k, v| extraction.gsub!(k, v)}
    roman_str = extraction.delete(' ')
    RomanConvertor.convert_roman_to_arabic(roman_str)
  end

  def extract(question)
    question.chomp(' ?')[12..-1]
    #"pish tegj glob glob"
  end

  def cut_string(questions_credits)
    #return an array of the unit with the metal eg. "glob prok Silver" for constructing the answer string
    cut_str = []
    #questions_credits = 
    #["how many Credits is glob prok Silver ?",
    #"how many Credits is glob prok Gold ?",
    #"how many Credits is glob prok Iron ?"]
    questions_credits.each do |q|
      arr = q.split(' ')
      metal_in_q = arr[-2]
      unit_in_q = arr[4 .. -3].join(" ")
      unit_metal_str_in_ans = unit_in_q + " " + metal_in_q
      cut_str << unit_metal_str_in_ans
    end
    cut_str
  end

  def metals_questions_to_answers(cut_str, units_map, metal_value_hash)
    result_str = []
   #cut_str= 
    #["glob prok Silver",
    #"glob prok Gold",
    #"glob prok Iron"]
    cut_str.each do |str|
      arr = str.split(' ')
      unit_str = arr[0 .. -2].join('')
      metal = arr[-1]
      sum = units_questions_to_answers(unit_str, units_map)
      metal_value = metal_value_hash[metal]
      metal_credits = sum * metal_value
      metal_credits = prettify_integer (metal_credits)
      result_str << str + " is " + metal_credits.to_s + " Credits"
    end
    result_str
    #result_str = ["glob prok Silver is 68 Credits",
    # "glob prok Gold is 57800 Credits",
    # "glob prok Iron is 782 Credits"]
  end

  def prettify_integer number
    #eg. if metal credits is 10.0, remove ".0" and return 10 
    # if metal credits is 10.5, keep the float. 
    if number.to_i == number
      number = number.to_i
    else
      number
    end
  end
end
