# frozen_string_literal: true

require "rubygems"
require "bundler"
require "bundler/gem_tasks"
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  warn e.message
  warn "Run `bundle install` to install missing gems"
  exit e.status_code
end
require "rake"
require "rspec/core"
require "rspec/core/rake_task"
require "standard/rake"

path = File.expand_path(__dir__)
Dir.glob("#{path}/lib/tasks/*.rake").each { |f| import f }

RSpec::Core::RakeTask.new(:spec) { |t| t.ruby_opts = "-E UTF-8" }
task default: :spec
