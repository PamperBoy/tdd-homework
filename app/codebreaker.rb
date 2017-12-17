class Codebreaker
  class Game
    attr_reader :output
    EXACT_MATCH = "+"
    NUMBER_MATCH = "-"
    NO_MATCH = ""
    WELCOME_MSG = "Welcome to Codebreaker"
    GUESS_MSG = "Enter guess:"
    RETRY_MSG = "Try guessing a number with four digits"

    def initialize(output)
      @output = output
    end

    def start(secret_number)
      @secret_number = secret_number
      respond(WELCOME_MSG)
      respond(GUESS_MSG)
    end

    def respond(message)
      output.puts message
    end

    def guess(input)
      valid_answer?(input) ? respond(RETRY_MSG) : match_number_check(input)
    end

    private

    def valid_answer?(input)
      input.length != @secret_number.length
    end

    def match_number_check(input)
      match_result, exact_result = [], []
      @secret_number.each_char.with_index do |seperate_number, i|
        if input[i] == seperate_number
          exact_result << EXACT_MATCH
        elsif input.include?(seperate_number)
          match_result << NUMBER_MATCH
        end
      end
      result = exact_result.concat(match_result).join("")
      respond(result)
    end
  end
end
