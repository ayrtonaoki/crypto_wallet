namespace :dev do
  desc "Config development environment"
  task setup: :environment do
    if Rails.env.development?
      spinner = TTY::Spinner.new("[:spinner] Running task")
      %x(rails db:drop db:create db:migrate db:seed)
      spinner.success('... Done!')
    else
      puts "Task can only be used on development environment"
    end
  end
end
