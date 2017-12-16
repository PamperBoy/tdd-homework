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
      return true if (input.length == 4 && input !~ /\D/)
      output.puts "Try guessing a number with four digits"
      return false
    end

    def compare_input(input)
      count = 0
      input.each_char { |number| count += 1 if @secret_number.include? number}
      count == 0 ? (output.puts "") : number_correct(input)
    end

    def number_correct(input)
      feedback = ""
      temp_secret_number = @secret_number.dup
      input.each_char do |number|
        if temp_secret_number.include? number
          feedback += "-"
          temp_secret_number.sub!(number, "")
        end
      end
      input.each_char.with_index do |number, index|
        if @secret_number.index(number) == index
          feedback.sub!("-", "+")
        end
      end
      feedback.length == 0 ? (output.puts "-") : (output.puts feedback)
    end

  end
end
