class Codebreaker
  class Game
    attr_reader :output

    def initialize(output)
      @output = output
    end

    def start(secret_number)
      @secret_number = secret_number

      output.puts "Welcome to Codebreaker"
      output.puts "Enter guess:"
    end

    def match_number_check(input)
      result = []
      match_result = []
      exact_result = []

      @secret_number.each_char.with_index do |snum, i|
        if input[i] == snum && input.include?(snum)
          exact_result << "+"

        elsif input.include?(snum)
          match_result << "-"
        else
          result << ""
        end

      end
      result = exact_result.concat(match_result)
      output.puts result.join("")
    end

    def guess(input)
      if input.length != 4
        output.puts "Try guessing a number with four digits"
      else
        match_number_check(input)
      end
      if input != @secret_number
        output.puts ""
      end
    end
  end
end
