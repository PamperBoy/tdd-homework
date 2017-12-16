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

    def guess(input)
      correct_input?(input)
      compare_input(input)
    end

    def correct_input?(input)
      return if (input.length == 4 && input.to_i.to_s.length == 4)
      output.puts "Try guessing a number with four digits"
    end

    def compare_input(input)
      count = 0
      input.each_char { |number| count += 1 if @secret_number.include? number}
      count == 0 ? (output.puts "") : (output.puts "-")
    end
  end
end
