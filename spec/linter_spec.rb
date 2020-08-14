require_relative '../lib/lintrules.rb'
require_relative '../lib/linter.rb'

describe 'LintRules' do
  let(:subject) { LintRules.new }
  let(:zero_unit_rule) { ['p {', 'padding: 0', 'margin: 0px;', '}'] }
  let(:no_zero_unit_rule) { ['h1 {', 'padding: 0', 'margin: 0;', '}'] }
  let(:indented_code) { ['.btn {','  padding: 0',   '  margin: 0;', '}'] }
  let(:not_indented_code) { ['.btn {','padding: 0', 'margin: 0;', '}'] }
  let(:errors) { [] }
  
  describe '#block_indentation' do
    it 'should return an array with error message when zero units are found on the line' do
      expect(subject.block_indentation(indented_code, errors)).to eql([])
    end
    it 'should return an array with error message when zero units are found on the line' do
      expect(subject.block_indentation(not_indented_code, errors)).to eql(["Expected indentation of 2 spaces on line 3"])
    end
    it 'should return an array with error message when zero units are found on the line' do
      expect(subject.block_indentation(zero_unit_rule, errors)).not_to be([])
    end

  end
  
  
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

end
