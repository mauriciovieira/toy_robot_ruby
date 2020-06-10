namespace :maux_robot do
  desc "Run linter and tests for CI"
  task :ci do
    puts "Running ruby standard code style linter"
    Rake::Task["standard"].invoke

    puts "Running rspec"
    Rake::Task["spec"].invoke
  end
end
