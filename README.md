# Merchant's Guide to the Galaxy

## Challenge

You decided to give up on earth after the latest financial collapse left 99.99% of the earth's population with 0.01% of the wealth. Luckily, with the scant sum of money that is left in your account, you are able to afford to rent a spaceship, leave earth, and fly all over the galaxy to sell common metals and dirt (which apparently is worth a lot).
 
Buying and selling over the galaxy requires you to convert numbers and units, and you decided to write a program to help you.
 
The numbers used for intergalactic transactions follows similar convention to the roman numerals and you have painstakingly collected the appropriate translation between them.
 
Roman numerals are based on seven symbols:
 
Symbol

Value

I = 1

V = 5

X = 10

L = 50

C = 100

D = 500

M = 1,000

 
Numbers are formed by combining symbols together and adding the values. For example, MMVI is 1000 + 1000 + 5 + 1 = 2006. Generally, symbols are placed in order of value, starting with the largest values. When smaller values precede larger values, the smaller values are subtracted from the larger values, and the result is added to the total. For example MCMXLIV = 1000 + (1000 - 100) + (50 - 10) + (5 - 1) = 1944.
 
* The symbols "I", "X", "C", and "M" can be repeated three times in succession, but no more. (They may appear four times if the third and fourth are separated by a smaller value, such as XXXIX.) "D", "L", and "V" can never be repeated.
* "I" can be subtracted from "V" and "X" only. "X" can be subtracted from "L" and "C" only. "C" can be subtracted from "D" and "M" only. "V", "L", and "D" can never be subtracted.
* Only one small-value symbol may be subtracted from any large-value symbol.
* A number written in Arabic numerals can be broken into digits. For example, 1903 is composed of 1, 9, 0, and 3. To write the Roman numeral, each of the non-zero digits should be treated separately. In the above example, 1,000 = M, 900 = CM, and 3 = III. Therefore, 1903 = MCMIII.
(Source: Wikipedia http://en.wikipedia.org/wiki/Roman_numerals)
 
Input to your program consists of lines of text detailing your notes on the conversion between intergalactic units and roman numerals.
 
You are expected to handle invalid queries appropriately.
 
Test input:
glob is I
prok is V
pish is X
tegj is L
glob glob Silver is 34 Credits
glob prok Gold is 57800 Credits
pish pish Iron is 3910 Credits
how much is pish tegj glob glob ?
how many Credits is glob prok Silver ?
how many Credits is glob prok Gold ?
how many Credits is glob prok Iron ?
how much wood could a woodchuck chuck if a woodchuck could chuck wood ?
 
Test Output:
pish tegj glob glob is 42
glob prok Silver is 68 Credits
glob prok Gold is 57800 Credits
glob prok Iron is 782 Credits
I have no idea what you are talking about

## Design
1. Read lines in the given text file
2. Categorize each line into 5 types and put them into separate arrays: 
- galaxy unit and its roman value (eg. glob is I) 
- metal and assigned credit value (eg. glob glob Silver is 34 Credits)
- question about value of galaxy unit (eg. how much is pish tegj glob glob ?)
- question about value of metal (eg. how many Credits is glob prok Silver ?)
- unknown question or statement (eg. how much wood could a woodchuck chuck if a woodchuck could chuck wood ?)
3. Process line based on these 5 line types 
- class Merchant reads text file and initialize 5 empty arrays for the 5 types of lines 
- module UnitValue returns a hash to indicate the assigned roman value of each galaxy unit (eg. "glob"=>"I")
- module RomanConvertor process any given roman string (eg. 'XXXVII' and translate it into arabic value)
- module MetalValue calculates how much each unit of metal worths (eg. each Silver worths 17 in sample.txt)
- module MetalsQuestions processes question about value of metal and return answers 
- module Output inserts answers into a final answer array according to the original questions order 

## Assumptions

1. Each line follow exact format (eg. spacing, order of words, etc.) as the sample text file

2. The input text file would have all the required information (all galaxy units have associated roman character, all metals have associated credit) and input text file would have questions of galaxy unit and/or metal (otherwise the programme would not return any results)

3. It will not have conflicting values of given information. For example, it would not have multiple lines assigning different credit value to the same metal (eg. "glob glob Silver is 34 Credits" and "glob glob Silver is 72 Credits" would not exist at the same time.)


## Improvements  

1. Add error handling and throw exceptions when the given lines are not following the required formats 

2. The current Rspec tests are high level, which only test if the returning lines are the expected answers to the questions. A lower level tests which cover each function should be written. 

3. Design the programme so that when the input text file lacks any required lines (eg. required info or questions), it will return corresponding warning messages (eg. "Missing roman value of galaxy unit glob in text file", "Missing questions in text file")

## Getting Started

### Prerequisites
required ruby version: ruby 2.2.4

### Installing

```
bundle install 
```
To load the given sample text file, run this: 
```
ruby merchant_in_galaxy.rb "./data/sample.txt"
```
Put the text file with the lines that you want to translate, and replace "sample.txt" in the line above with the given file name. eg: 

```
ruby merchant_in_galaxy.rb "./data/anytextfile.txt” 
```
Please note that the lines of the text file has to follow the exact format of sample.txt file. 

## Running the tests

To run the Rspec test, run this in console: 

```
rspec 
```
It will return this when all the tests are passed: 
```

Merchant
  #final_value
    final_value returns the credit values of metals
      returns an array containing the answers to questions
    final_value returns translate the value of units
      returns an array containing the answers to questions
    final_value returns a response to unknown questions/statement
      returns an array containing the answers to questions

RomanConvertor
  #self.convert_roman_to_arabic
    converts roman number to arabic

Finished in 0.00479 seconds (files took 0.6009 seconds to load)
4 examples, 0 failures
```

## Gems used

* Rspec
* Pry