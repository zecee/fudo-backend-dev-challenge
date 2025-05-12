require 'rake/testtask'

Rake::TestTask.new(:run_tests) do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.warning = true
end

task default: :run_tests
