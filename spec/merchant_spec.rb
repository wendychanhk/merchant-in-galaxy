require 'spec_helper'

describe Merchant do
  before do
    # Merchant.new is slow. Input file is always the same,
    # therefore it only needs to process sample.txt once.
    # Speeds up tests
    @merchant = Merchant.new('./data/sample.txt')
  end

  describe '#final_value' do
# a high level test to cover all the QA pairs sample.txt 
    context 'final_value returns the credit values of metals' do
      it 'returns an array containing the answers to questions' do
        #Question
        expect(@merchant.instance_variable_get(:@questions_credits)).to include('how many Credits is glob prok Silver ?')
        # Answer
        expect(@merchant.final_result).to include('glob prok Silver is 68 Credits')

        # Question
        expect(@merchant.instance_variable_get(:@questions_credits)).to include('how many Credits is glob prok Gold ?')
        # Answer
        expect(@merchant.final_result).to include('glob prok Gold is 57800 Credits')

        # Question
        expect(@merchant.instance_variable_get(:@questions_credits)).to include('how many Credits is glob prok Iron ?')
        # Answer
        expect(@merchant.final_result).to include('glob prok Iron is 782 Credits')
      end
    end

    context 'final_value returns translate the value of units' do
      it 'returns an array containing the answers to questions' do
        # Question
        expect(@merchant.instance_variable_get(:@questions_units)).to include('how much is pish tegj glob glob ?')
        # Answer
        expect(@merchant.final_result).to include('pish tegj glob glob is 42')
      end
    end

    context 'final_value returns a response to unknown questions/statement' do
      it 'returns an array containing the answers to questions' do
        # Question
        expect(@merchant.instance_variable_get(:@unknowns)).to include('how much wood could a woodchuck chuck if a woodchuck could chuck wood ?')
        # Answer
        expect(@merchant.final_result).to include('I have no idea what you are talking about')
      end
    end
  end
end


