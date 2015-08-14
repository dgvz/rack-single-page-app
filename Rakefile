exec(*(["bundle", "exec", $PROGRAM_NAME] + ARGV)) if ENV['BUNDLE_GEMFILE'].nil?

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => ex
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rdoc/task'
require 'rake/testtask'
require 'git-version-bump/rake-tasks'

desc "Run all the tests"
task :default => [:test]

desc "Run specs"
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/spec_*.rb']
end

