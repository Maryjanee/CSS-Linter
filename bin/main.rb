require 'colorize'
require_relative '../lib/linter'

file = File.open(ARGV[0]).to_a
errors = Linter.lintcheck(file)

if errors.empty?
  puts 'file checked , no errors found '.green
else
  puts 'Done! Check the following for more Information '.blue
  puts '••••••••••••••••••••••••••••••••••••••••••'
  errors.each { |error| puts error.red }
end
