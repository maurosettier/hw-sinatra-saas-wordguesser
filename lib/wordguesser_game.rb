class WordGuesserGame
  attr_accessor :word, :guesses, :wrong_guesses

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/wordguesser_game_spec.rb pass.

  # Get a word from remote "random word" service

  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end
  
  def guess(letter)

    raise ArgumentError if letter.nil? || letter == '' || !letter.match?(/[A-Z]/i)

    letter = letter.downcase

    if @word.include?(letter)
       return false if @guesses.include?(letter)
       @guesses += letter
    else
       return false if @wrong_guesses.include?(letter)
        @wrong_guesses += letter
    end
    true

  end

  

  # You can test it by installing irb via $ gem install irb
  # and then running $ irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> WordGuesserGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://randomword.saasbook.info/RandomWord')
    Net::HTTP.new('randomword.saasbook.info').start { |http|
      return http.post(uri, "").body
    }
  end

end
