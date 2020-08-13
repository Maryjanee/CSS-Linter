require_relative ".lintrules.rb"

class Linter
  def initialize(file)
    @errorsArr = []
    @lines = File.open(file).to_a
  end
  def self.lintcheck(file)
     if file.positive?
      runcheck = LintRules.new
      runcheck.block_indentation(lines, errorArr)
      runcheck.block_opening_brace_space_before(lines, errorArr)
      runcheck.trailing_space(lines, errorArr)
      runcheck.length_Zero_no_Unit(lines, errorArr)
      no_extra_semicolons(lines, errorArr)
     end
     errorArr
  end
end