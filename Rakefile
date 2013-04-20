require "bundler/gem_tasks"

require 'rspec/core/rake_task'

namespace :spec do
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.pattern = Dir['spec/*/**/*_spec.rb'].reject { |f| f['/integrations'] }
  end

  RSpec::Core::RakeTask.new(:integration) do |t|
    t.pattern = 'spec/integrations*/**/*_spec.rb'
  end

  desc "Run all specs"
  task :full => [:unit, :integration]
end

task :default => "spec:unit"
