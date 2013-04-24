desc 'run post-deployment stuff'
task :post_deploy do

  # Precompile assets
  puts 'Precompiling assets'
  Rake::Task["assets:precompile"].invoke

  # Run migrations
  puts 'Running migrations if necessary'
  Rake::Task["db:migrate"].invoke

  # Trigger Unicorn reexec with 0 downtime
  puts 'restarting unicorns'
  system "#{ENV['HOME']}/unicorn.sh upgrade referenzmodul_demoapplikation_#{ENV['RAILS_ENV']}"

  # Enable monit monitoring
  puts 'enable monit'
  system "monit -g referenzmodul_demoapplikation_#{ENV['RAILS_ENV']} monitor"

  # Notify Airbrake of deployment
  puts 'notifying airbrake'
  system "rake airbrake:deploy TO=#{ENV['RAILS_ENV']} REVISION=$(git rev-parse HEAD)"
end
