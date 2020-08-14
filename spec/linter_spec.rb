require_relative '../lib/lintrules.rb'
require_relative '../lib/linter.rb'

describe 'LintRules' do
  let(:subject) { LintRules.new }
  let(:zero_unit_rule) { ['p {', 'padding: 0', 'margin: 0px;', '}'] }
  let(:no_zero_unit_rule) { ['h1 {', 'padding: 0', 'margin: 0;', '}'] }
  let(:errors) { [] }

  describe '#length_zero_no_unit' do
    it 'should return an array with error message when zero units are found on the line' do
      expect(subject.length_zero_no_unit(zero_unit_rule, errors)).to eql(["Zero values do not need units on line: 3"])
    end

    it 'should return an empty array when no zero units are found on the line' do
      expect(subject.length_zero_no_unit(no_zero_unit_rule, errors)).to eql([])
    end
    
    it 'should not return an empty array when zero units are found on the line' do
      expect(subject.length_zero_no_unit(zero_unit_rule, errors)).not_to eql([])
    end
  end

  # describe '#valid_move' do
  #   it 'returns true for an valid move ' do
  #     player = Player.new(['✘', '✘', 2, 3, '◯', '◯', 7, 8, 9], player_one, player_two)
  #     expect(player.valid_move(8)).to eql(true)
  #   end

  #   it 'returns true for a valid range of valid input ' do
  #     player = Player.new([*1..9], player_one, player_two)
  #     expect(player.valid_move(17)).not_to eql(false)
  #   end

  #   it 'returns false for an invalid move ' do
  #     player = Player.new(gameboard, player_one, player_two)
  #     expect(player.valid_move(2)).to eql(false)
  #   end
  # end

  # describe '#current_player' do
  #   it 'returns the current player' do
  #     player = Player.new(gameboard, player_one, player_two)
  #     expect(player.current_player).to eql('Ade')
  #   end
  # end

  # describe '#insert_into_board' do
  #   it 'updates and returns play counter variable' do
  #     player = Player.new(gameboard, player_one, player_two)
  #     expect(player.insert_into_board(7)).to eql(1)
  #   end
  # end
end
