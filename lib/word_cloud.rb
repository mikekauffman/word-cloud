class WordCloud
  def initialize(input)
    @input = input
  end

  def clean_data
    word_array = []
    @input.each do |k, v|
      v.each do |words|
        word_array << words.split(" ")
      end
    end
    one_words = []
    word_array.each do |words|
      words.each do |word|
        one_words << word
      end
    end
    h = Hash.new
    one_words.each { |w|
      if h.has_key?(w)
        h[w] = h[w] + 1
      else
        h[w] = 1
      end
    }
    final_hash = Hash.new
    h.each do |k, v|
      final_hash[k.downcase] = {:count => v, :people => 'NONE'}
    end
    final_hash
  end
end