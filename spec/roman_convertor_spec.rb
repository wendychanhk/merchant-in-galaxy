require 'spec_helper'

describe RomanConvertor do
  #a test covering the conversions of some sample roman numerals 

  let(:roman) { RomanConvertor }

  describe '#self.convert_roman_to_arabic' do
    it "converts roman number to arabic" do
      expect(roman.convert_roman_to_arabic('XXII')).to eq(22)
      expect(roman.convert_roman_to_arabic('XXXVII')).to eq(37)
      expect(roman.convert_roman_to_arabic('XLI')).to eq(41)
      expect(roman.convert_roman_to_arabic('XLVIII')).to eq(48)
      expect(roman.convert_roman_to_arabic('LIV')).to eq(54)
      expect(roman.convert_roman_to_arabic('LVII')).to eq(57)
      expect(roman.convert_roman_to_arabic('LXII')).to eq(62)
      expect(roman.convert_roman_to_arabic('LXXIV')).to eq(74)
      expect(roman.convert_roman_to_arabic('XCVII')).to eq(97)
      # ...
    end
  end
end