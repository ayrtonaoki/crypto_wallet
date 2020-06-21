# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Coin.create!(
  description: 'Bitcoin',
  acronym: 'BTC',
  url_image: 'https://w7.pngwing.com/pngs/450/133/png-transparent-bitcoin-cryptocurrency-virtual-currency-decal-blockchain-info-bitcoin-text-trademark-logo.png'
)

Coin.create!(
  description: 'Ethereum',
  acronym: 'ETH',
  url_image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/471px-Ethereum_logo_2014.svg.png'
)

Coin.create!(
  description: 'Dash',
  acronym: 'DASH',
  url_image: 'https://cdn.freebiesupply.com/logos/large/2x/dash-3-logo-png-transparent.png'
)