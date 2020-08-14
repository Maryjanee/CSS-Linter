require_relative '../lib/lintrules.rb'
require_relative '../lib/linter.rb'

describe 'LintRules' do
  let(:subject) { LintRules.new }
  let(:zunit) { ['p {', 'padding: 0;', 'margin: 0px;', '}'] }
  let(:no_zunit) { ['h1 {', 'padding: 0;', 'margin: 0;', '}'] }
  let(:indent) { ['.btn {', '  padding: 0;', '  margin: 0;', '}'] } # .btn {\npadding}
  let(:multiple_colons) { ['.btn {', '  padding: 0;;', 'margin: 0;', '}'] }
  let(:nindent) { ['.btn {', 'padding: 0;', '  margin: 0;', '}'] }
  let(:trailing_space) { ['p {', 'padding: 0;', 'margin: 0;  ', '}'] }
  let(:one_trailing_space) { ['p {', 'padding: 0;   ', 'margin: 0;', '}'] }
  let(:block) { ['textarea{\n', 'padding: 0;', '\nmargin: 0;', '\n}'] }
  let(:space) { ['header{\n', 'padding:0;', '\nmargin: 0;', '\n}'] }
  let(:empty_rule) { ['p {}'] }
  let(:errors) { [] }

  describe '#block_indentation' do
    it 'should return an empty array when a line is properly indented' do
      expect(subject.block_indentation(indent, errors)).to eql([])
    end
    it 'should return an array with error message on line not properly indented' do
      expect(subject.block_indentation(nindent, errors)).to eql(['Expected indentation of 2 spaces on line 2'])
    end
    it 'should not return an array when a line is not properly indented' do
      expect(subject.block_indentation(zunit, errors)).not_to be([])
    end
  end

  describe '#block_opening_brace_space_before' do
    it 'should return an empty array when space is found before the opening block' do
      expect(subject.block_opening_brace_space(indent, errors)).to eql([])
    end
    it 'should return a message with line number when no space is found before the opening block' do
      expect(subject.block_opening_brace_space(block, errors)).to eql(['Expect space before opening brace on 1'])
    end
  end

  describe '#trailing_space' do
    it 'should return an array with message where a trailing space is found' do
      expect(subject.trailing_space(one_trailing_space, errors)).to eql(['Trailing space found on line: 2'])
    end
    it 'should return an array with message for lines where a trailing space is found' do
      expect(subject.trailing_space(trailing_space, errors)).to eql(['Trailing space found on line: 3'])
    end
    it 'should not return an array with message for lines whereno trailing space is found' do
      expect(subject.trailing_space(zunit, errors)).not_to be(['Trailing space found on line: 2'])
    end
  end

  describe '#no_extra_semicolons' do
    it 'should return messages on lines where extra semicolons are added' do
      expect(subject.no_extra_semicolons(multiple_colons, errors)).to eql(['Extra semicolons found on line: 2'])
    end
    it 'should return empty array on lines where no extra semicolons are added' do
      expect(subject.no_extra_semicolons(indent, errors)).to eql([])
    end
  end

  describe '#declaration_colon_space_after' do
    it 'should return messages on lines where space where ther is no space after declaration ' do
      expect(subject.declaration_colon_space_after(space, errors)).to eql(["Expected single space after ':' on :2"])
    end
    it 'should not return an empty array where space on single line declaration does not exist' do
      expect(subject.declaration_colon_space_after(indent, errors)).not_to be([])
    end
  end

  describe '#length_zero_no_unit' do
    it 'should return an array with error message when zero units are found on the line' do
      expect(subject.length_zero_no_unit(zunit, errors)).to eql(['Zero values do not need units on line: 3'])
    end

    it 'should return an empty array when no zero units are found on the line' do
      expect(subject.length_zero_no_unit(no_zunit, errors)).to eql([])
    end

    it 'should not return an empty array when zero units are found on the line' do
      expect(subject.length_zero_no_unit(zunit, errors)).not_to eql([])
    end
  end

  describe '#no_empty_rule' do
    it 'should return an empty array when a rule has content' do
      expect(subject.no_empty_rule(zunit, errors)).to eql([])
    end

    it 'should not return an empty array when an empty rule' do
      expect(subject.no_empty_rule(empty_rule, errors)).not_to eql([])
    end

    it 'should not return an empty array when an empty rule' do
      expect(subject.no_empty_rule(empty_rule, errors)).to eql(['Unexpected empty block: 1'])
    end
  end
end
