namespace :example  do
  desc "This is our awesome example cron job!"
  task :a_cron_job => :environment do
    logger.info "Hello world" # pretend this was a call to Hello.world
  end
end