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
      return if !(correct_input?(input))
      compare_input(input)
    end

    def correct_input?(input)
      return true if (input.length == 4 && input.to_i.to_s.length == 4)
      output.puts "Try guessing a number with four digits"
      return false
    end

    def compare_input(input)
      count = 0
      input.each_char { |number| count += 1 if @secret_number.include? number}
      count == 0 ? (output.puts "") : number_correct(input)
    end

    def number_correct(input)
      count = 0
      feedback = ""
      input.each_char do |number|
        if @secret_number.index(number) == count
          feedback += "+"
        end
        count += 1
      end
      feedback.length == 0 ? (output.puts "-") : (output.puts feedback)
    end

  end
end
