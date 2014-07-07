class WordCloud

  def initialize(input)
    @input = input
  end

  def clean_data
    output_hash = {}
    @input.each do |name, lines|
      words = lines.map { |word| word.split(" ") }
      words.flatten.each do |word|
        if output_hash.has_key?(word.downcase)
          output_hash[word.downcase][:count] += 1
          output_hash[word.downcase][:people] << name unless output_hash[word.downcase][:people].include?(name)
        else
          output_hash[word.downcase] = {count: 1, people: [name]}
        end
      end
    end
    output_hash
  end

end