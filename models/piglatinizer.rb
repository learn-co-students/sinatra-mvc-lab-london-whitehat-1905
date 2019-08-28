class PigLatinizer
  def piglatinize(input)
    self.class.process(input)
  end

  def self.begins_with_vowel?(string)
    %w(a e i o u).include?(string[0].downcase)
  end

  def self.latinize(word)
    if begins_with_vowel?(word)
      "#{word}way"
    else
      word.split('').each_with_index do |char, index|
        if begins_with_vowel?(char)
          return word[index..-1] + word[0...index] + 'ay'
        end
      end
    end
  end

  def self.process(input)
    input.split(' ').map { |word| self.latinize(word) }.join(' ')
  end
end

