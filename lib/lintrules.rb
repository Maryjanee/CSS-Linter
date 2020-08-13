class LintRules
  def block_indentation(lines, error)
    lines.each_with_index do |line, index|
      if line.include?('{\n')
        error << "Expected indentation of 2 spaces on line #{index + 1}" unless line.match(/^\s{2}[a-zA-Z]/)
      end
    end
    error
  end

  def block_opening_brace_space_before(lines, error)
    lines.each_with_index do |line, index|
      if line.include?("{\n")
        error << "Expect space before opening brace on #{index + 1}" unless line.end_with?(" \n")
      end
    end
    error
  end

  def trailing_space(lines, error)
    lines.each_with_index do |line, index|
      error << "Trailing space found on line: #{index + 1}" if line.end_with?("; \n")
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
