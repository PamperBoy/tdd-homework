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

      @secret_number.each_char.with_index do |snum, i|
        if input.include?(snum) && i == input.index(snum)
          match_result.unshift("+")
        elsif input.include?(snum)
          match_result << "-"
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
