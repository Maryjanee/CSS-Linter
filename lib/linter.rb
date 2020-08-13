require_relative '../lib/lintrules.rb'

class Linter
  def self.lintcheck(file)
    errors = []
    lines = file
    unless file.empty?
      runcheck = LintRules.new
      runcheck.block_indentation(lines, errors)
      runcheck.block_opening_brace_space_before(lines, errors)
      runcheck.trailing_space(lines, errors)
      runcheck.length_Zero_no_Unit(lines, errors)
      runcheck.no_extra_semicolons(lines, errors)
      runcheck.no_empty_rule(lines, errors)
    end
    errors
  end
end
