require 'spec_helper'
require 'codebreaker' # load the file in app/codebreaker.rb

RSpec.describe Codebreaker do
  let(:game)    { Codebreaker::Game.new(output) }
  let(:output)  { double('output').as_null_object } # dont touch this

  context "guess starts with 0" do
    let(:secret_number) { '1234' }
    it "does not ask for new input" do
      input = '0000'
      game.start(secret_number)
      expect(output).to_not receive(:puts).with("Try guessing a number with four digits")

      game.guess(input)
    end
  end
end
