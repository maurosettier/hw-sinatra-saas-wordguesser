require "bundler"
Bundler.setup
Bundler::GemHelper.install_tasks

require "rake"
require "yaml"

require "rspec/core/rake_task"

require "cucumber/rake/task"
Cucumber::Rake::Task.new(:cucumber)

desc "Run all examples"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.ruby_opts = %w[-w]
end

desc 'Run RuboCop on the lib directory'
task :rubocop do
  sh 'bundle exec rubocop lib'
end

task :default => [:spec, :cucumber, :rubocop]