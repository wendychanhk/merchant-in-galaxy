#require 'pry'
require './lib/merchant'
#output lines of result by taking the first argument of text file, eg. "./data/sample.txt"
puts Merchant.new(ARGV[0]).final_result

