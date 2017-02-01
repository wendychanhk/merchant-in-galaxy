require 'pry'
require './lib/unit_value'
require './lib/metal_value'
require './lib/metals_questions'
require './lib/output'

class Merchant
  include UnitValue
  include MetalValue
  include MetalsQuestions
  include Output

  attr_reader :final_result

  #input_file  = "data/sample.txt"
  def initialize(input_file)
    @units = []
    @metals = []
    @questions_units = []
    @questions_credits  = []
    @unknowns = []
    @array_questions_order = []
    process_file(input_file)

    unit_to_roman_hash = unit_to_roman(@units)
    metal_value_hash = create_metal_value_hash(@metals, unit_to_roman_hash)
    units_answer = answers_to_questions_units(@questions_units, unit_to_roman_hash)
    credits_answer = answers_to_questions_metals(@questions_credits, unit_to_roman_hash, metal_value_hash)
    @final_result = output(units_answer, credits_answer, @array_questions_order)
  end

  private

  def process_file(input_file)
    File.open(input_file, "r") do |f|
      f.each_line do |line|
        case
        when line.match(/^([a-z]+) is ([I|V|X|L|C|D|M])$/)
          @units << line.chomp
          #each_line includes line breaks. strip them using chomp
        when line.match(/^([a-z ]+)([A-Z]\w+) is (\d+) Credits$/)
          @metals<< line.chomp
        when line.match(/^how much is ((\w+ )+)\?$/)
          @questions_units  << line.chomp
          #to create an array of questions order for outputting answers according to the inputting questions order 
          @array_questions_order << 0
        when line.match(/^how many Credits is ([a-z ]+)([A-Z]\w+) \?$/)
          @questions_credits << line.chomp
          @array_questions_order << 1
        else
          @unknowns << line.chomp
          @array_questions_order << 2
        end
      end
    end
  end
end
