# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

task safe_lint: [] do
  sh 'rubocop --auto-correct'
end

task lint_all: [] do
  sh 'rubocop --auto-correct-all'
end

task build_debug: [] do
  sh 'cd CFPrefs && xcodebuild -scheme CFPrefs -configuration Debug build'
end

task build_release: [] do
  sh 'cd CFPrefs && xcodebuild -scheme CFPrefs -configuration Release build'
end
