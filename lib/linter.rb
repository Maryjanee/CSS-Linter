class Linter
  def block_indentation(lines, errorArr)
    lines.each_with_index do |line, index|
      if line.include?(':')
        errorArr << "Expected indentation of 2 spaces on line #{index + 1}" unless line.match(/^\s{2}[a-zA-Z]/)
      end
    end
    errorArr
  end

  def block_opening_brace_space_before(lines, errorArr)
    lines.each_with_index do |line, index|
      if line.include?("{\n")
        linecheck = line.slice!('{')
        errorArr << "Expect space before opening brace on #{index + 1}" unless line.end_with?(" \n")
      end
    end
  end
  
  def trailing_space(lines, errorArr)
    lines.each_with_index do |line, index|
      if line.end_with?("; \n")
        errorArr << "Trailing space found on line: #{index + 1}" 
      end
    end
  end
  
  def length_Zero_no_Unit(lines, errorArr)
    lines.each_with_index do |line, index|
      if line.include?(";")
        errorArr << "Zero values do not need units on line: #{index + 1}" if line.match(/[0](\w|%)/) 
      end
    end
  end
  
  def no_extra_semicolons(lines, errorArr)
    lines.each_with_index do |line, index|
        errorArr << "Extra semicolons found on line: #{index + 1}" if line.count(";") != 1
      end
    end
  end
end
