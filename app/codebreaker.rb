class Codebreaker
  class Game
    attr_reader :output
    INCORRECT_INPUT = "Try guessing a number with four digits"
    NUMBER_MATCH = "-"
    EXACT_MATCH = "+"
    NO_MATCH = ""

    def initialize(output)
      @output = output
    end

    def start(secret_number)
      @secret_number = secret_number

      output.puts "Welcome to Codebreaker"
      output.puts "Enter guess:"
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
      matches.length == 0 ? NO_MATCH : include_exact_matches(input, matches)
    end

    def find_matches(input)
      unmatched_numbers = @secret_number.dup
      input.each_char do |number|
          unmatched_numbers.sub!(number, "") if unmatched_numbers.include? number
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
