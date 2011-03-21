#encoding: utf-8
module KoelnerPhoneticEncoder
  def phonetic_code
    code = KoelnerPhoneticEncoder.encode_string(self.to_str)
    code = KoelnerPhoneticEncoder.reduce_multiples(code)
    KoelnerPhoneticEncoder.remove_zeroes(code)
  end

  def self.encode_string(string)
    string = string.downcase.gsub('ß','ss').gsub('ä', 'ae').gsub('ö', 'oe').gsub('ü', 'ue')
    code = ''
    syllable_onset = true
    characters = string.split('') + %w[- -]
    characters.each_cons(3) do |slice|
      case slice.join
      when /^[aeioujy]/ then
        code << '0'
      when /^b/ then
        code << '1'
      when /^p[^h]/  then
          code << '1'
      when /^ph/ then
          code << '3'
      when /^[dt][^csz]/ then
          code << '2'
      when /^[dt][csz]/ then
          code << '8'
      when /^[fvw]/
        code << '3'
      when /^[gkq]/
        code << '4'
      when /^c[ahkloqrux]/ && syllable_onset
        code << '4'
      when /^[^sz]c[ahkloqrux]/ 
        code << '4'
      when /^[^cqk]x/ 
        code << '48'
      when /^l/
        code << '5'
      when /^[mn]/
        code << '6'
      when /^r/
        code << '7'
      when /^[sz]/
        code << '8'
      when /^[sz]c/
        code << '8'
      when /^c[^ahkloqrux]/ && syllable_onset
        code << '8'
      when /^c[^ahkoqux]/ 
        code << '8'
      when /^[ckq]x/
        code << '8'
      end
      syllable_onset = false
    end
    code
  end
  def self.reduce_multiples(code)
    code.gsub /(\d)\1/, '\1'
  end
  def self.remove_zeroes(code)
    unless code.empty?
      code[0..0] << code[1..-1].delete('0') 
    else
      code
    end
  end
end
