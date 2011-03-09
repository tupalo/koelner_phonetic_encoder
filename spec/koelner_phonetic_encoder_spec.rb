require 'spec_helper'

describe KoelnerPhoneticEncoder do
  it "should enhance string with the 'phonetic code' method" do
    "MyString".should respond_to(:phonetic_code)
  end
  it "should return the correct values for the known strings" do
    "Wikipedia".phonetic_code.should == '3412'
    "Breschnew".phonetic_code.should == '17863'
    "Müller-Lüdenscheidt".phonetic_code.should == '65752682'
  end
  it "should encode a string to a raw code string per letter (2 per umlaut)" do
    KoelnerPhoneticEncoder.encode_string("Müller-Lüdenscheidt").should == '600550750020680022'
    KoelnerPhoneticEncoder.encode_string("Müller-Lüdenscheidt").size.should == 18
  end
  it "should remove all duplicated codes from a code string" do
    code = KoelnerPhoneticEncoder.encode_string("Müller-Lüdenscheidt")
    KoelnerPhoneticEncoder.reduce_multiples(code).should == '6050750206802'
  end
  it "should remove all 0 codes except at the beginning" do
    KoelnerPhoneticEncoder.remove_zeroes('6050750206802').should == '65752682'
    KoelnerPhoneticEncoder.remove_zeroes('06050750206802').should == '065752682'
  end
end
