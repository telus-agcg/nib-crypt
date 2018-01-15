require 'bundler/gem_tasks'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
end

require 'rainbow/ext/string' unless String.respond_to?(:color)
require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop)

task default: %i(rubocop spec)

task ci: :default do
  system('codeclimate-test-reporter')
end
