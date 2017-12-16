class Codebreaker
  class Game
    attr_reader :output
    INCORRECT_INPUT = "Try guessing a number with four digits"
    NUMBER_MATCH = "-"
    EXACT_MATCH = "+"
    NO_MATCH = ""

    def initialize(output)
      @output = output
      @feedback = ""
    end

    def start(secret_number)
      @secret_number = secret_number

      output.puts "Welcome to Codebreaker"
      output.puts "Enter guess:"
    end

    def guess(input)
      correct_input?(input) ? compare_input_to_secret_number(input) : (output.puts INCORRECT_INPUT)
    end

    private

    def correct_input?(input)
      input.length == 4 && input !~ /\D/
    end

    def compare_input_to_secret_number(input)
      count = 0
      input.each_char { |number| count += 1 if @secret_number.include? number}
      count == 0 ? (output.puts NO_MATCH) : find_correct_numbers(input)
    end

    def find_correct_numbers(input)
      find_number_matches(input)
      find_exact_number_matches(input)
      output.puts @feedback
    end

    def find_number_matches(input)
      temp_secret_number = @secret_number.dup
      input.each_char do |number|
        if temp_secret_number.include? number
          @feedback += NUMBER_MATCH
          temp_secret_number.sub!(number, "")
        end
      end
    end

    def find_exact_number_matches(input)
      input.each_char.with_index do |number, index|
        @feedback.sub!(NUMBER_MATCH, EXACT_MATCH) if @secret_number.index(number) == index
      end
    end

  end
end
