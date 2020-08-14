# rubocop:disable Lint/Void
class LintRules
  def block_indentation(lines, error)
    lines.each_with_index do |line, index|
      if line.include?(';')
        error << "Expected indentation of 2 spaces on line #{index + 1}" unless line.match(/^\s{2}[a-zA-Z]/)
      end
    end
    error
  end

  def block_opening_brace_space(lines, error)
    lines.each_with_index do |line, index|
      if line.include?('{')
        error << "Expect space before opening brace on #{index + 1}" if line.match(/([a-zA-Z]+|\]|\)){/)
      end
    end
    error
  end
  /:[a-zA-Z0-9]+/
  def declaration_colon_space_after(lines, error)
    lines.each_with_index do |line, index|
      next unless line.include?(';')

      error << "Expected single space after ':' on :#{index + 1}" if line.match(/:[a-zA-Z0-9]+/)
    end
    error
  end

  def trailing_space(lines, error)
    lines.each_with_index do |line, index|
      if line.include?(';')
        error << "Trailing space found on line: #{index + 1}" if line.match(/; {1,}$/)
      end
    end
    error
  end

  def length_zero_no_unit(lines, error)
    lines.each_with_index do |line, index|
      if line.include?(';')
        error << "Zero values do not need units on line: #{index + 1}" if line.match(/[\s](0\w|0%)/)
      end
    end
    error
  end

  def no_extra_semicolons(lines, error)
    lines.each_with_index do |line, index|
      error << "Extra semicolons found on line: #{index + 1}" if line.match(/;{2,}/)
    end
    error
  end

  def no_empty_rule(lines, error)
    lines.each_with_index do |line, index|
      error << "Unexpected empty block: #{index + 1}" if line.match(/{\n*}/)
    end
    error
  end
end

# rubocop:enable Lint/Void
