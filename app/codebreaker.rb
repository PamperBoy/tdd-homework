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
      match_result = []
      input_numbers = input.split("")
      secret_numbers = @secret_number.split("")

      input_numbers.each_with_index do | input_number, i |
        if @secret_number.include?(input_number)
          if secret_numbers[i] == input_number
            match_result << "+"
          else
            match_result << "-"
          end
        else
          match_result << ""
        end
      end
      output.puts match_result.join("")
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
