class Linter
  def block_indentation(lines, errorArr)
    lines.each_with_index do |line, index|
      if line.include?(":")
        errorArr << "Expected indentation of 2 spaces on line #{index+1}" if !line.match(/^\s{2}[a-zA-Z]/) 
      end
    end
    errorArr
  end
end