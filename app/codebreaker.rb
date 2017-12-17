class Codebreaker
  class Game
    attr_reader :output
    WELCOME_MESSAGE.freeze = 'Welcome to Codebreaker'
    ASK_GUESS.freeze = 'Enter guess:'
    INCORRECT_INPUT.freeze = 'Try guessing a number with four digits'
    NUMBER_MATCH.freeze = '-'
    EXACT_MATCH.freeze = '+'
    NO_MATCH.freeze = ''

    def initialize(output)
      @output = output
    end

    def start(secret_number)
      @secret_number = secret_number

      output.puts WELCOME_MESSAGE
      output.puts ASK_GUESS
    end

    def guess(input)
      output.puts generate_feedback(input)
    end

    private

    def generate_feedback(input)
      correct_input?(input) ? generate_guidance(input) : INCORRECT_INPUT
    end

    def correct_input?(input)
      input.length == 4 && input !~ /\D/
    end

    def generate_guidance(input)
      matches = find_matches(input)
      matches.empty? ? NO_MATCH : include_exact_matches(input, matches)
    end

    def find_matches(input)
      unmatched_numbers = @secret_number.dup
      input.each_char do |number|
        unmatched_numbers.sub!(number, '') if unmatched_numbers.include? number
      end
      NUMBER_MATCH * (@secret_number.length - unmatched_numbers.length)
    end

    def include_exact_matches(input, matches)
      input.each_char.with_index do |number, index|
        matches.sub!(NUMBER_MATCH, EXACT_MATCH) if @secret_number[index] == number
      end
      matches
    end
  end
end
