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
end
