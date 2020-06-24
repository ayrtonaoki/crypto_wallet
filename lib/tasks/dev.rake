namespace :dev do
  desc "Config development environment"
  task setup: :environment do
    if Rails.env.development?
      set_setup_task("Dropping database") { %x(rails db:drop) }
      set_setup_task("Creating database") {%x(rails db:create) }
      set_setup_task("Migrating database") { %x(rails db:migrate) }
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
    else
      puts "Task can only be used on development environment"
    end
  end

  desc "Create coins"
  task add_coins: :environment do
    set_setup_task("Creating coins") do
      coins = [
        {
          description: 'Bitcoin',
          acronym: 'BTC',
          url_image: 'https://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png',
          mining_type: MiningType.find_by(acronym: 'PoW')
        },
        {
          description: 'Ethereum',
          acronym: 'ETH',
          url_image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/471px-Ethereum_logo_2014.svg.png',
          mining_type: MiningType.find_by(acronym: 'PoS')
        },
        {
          description: 'Dash',
          acronym: 'DASH',
          url_image: 'https://www.dash.org/wp-content/uploads/dash-d-circle-1000.png',
          mining_type: MiningType.find_by(acronym: 'PoC')
        }
      ]
      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Create mining types"
  task add_mining_types: :environment do
    set_setup_task("Creating mining types") do
      mining_types = [
        {description: 'Proof of Work', acronym: 'PoW'},
        {description: 'Proof of Stake', acronym: 'PoS'},
        {description: 'Proof of Capacity', acronym: 'PoC'}
      ]
      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private
    def set_setup_task(message)
      spinner = TTY::Spinner.new("[:spinner] #{message}")
      spinner.auto_spin
      yield
      spinner.success('... Done!')
    end
end
