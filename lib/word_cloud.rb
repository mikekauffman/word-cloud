class WordCloud
  def initialize(input)
    @input = input
  end

  def buzzword_hash
    h = {}
    @input.each do |name, lines|
      words = lines.map { |word| word.split(" ") }
      words.flatten.each do |word|
        if h.has_key?(word.downcase)
          h[word.downcase][:count] += 1
          h[word.downcase][:people] << name unless h[word.downcase][:people].include?(name)
        else
          h[word.downcase] = {count: 1, people: [name]}
        end
      end
    end
    h
  end

end