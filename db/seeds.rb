# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_ca = User.create!(email:'ca@ca.com', password:'123456', password_confirmation:'123456')

user_s1 = User.create!(email:'s1@s1.com', password:'123456', password_confirmation:'123456')

user_s2 = User.create!(email:'s2@s2.com', password:'123456', password_confirmation:'123456')

user_m1 = User.create!(email:'m1@m1.com', password:'123456', password_confirmation:'123456')

user_m2 = User.create!(email:'m2@m2.com', password:'123456', password_confirmation:'123456')

user_i1 = User.create!(email:'i1@i1.com', password:'123456', password_confirmation:'123456')

user_i2 = User.create!(email:'i2@i2.com', password:'123456', password_confirmation:'123456')

ca_melbourne = Listing.create!( title: 'Coder Academy', street_address: '120 Spencer Street', city: 'Melbourne', country_code: 'AU', bed_count: 35, bedroom_count: 1, bathroom_count: 3, description: 'Cozy while you code', night_fee_cents: '5000', cleaning_fee_cents: '1000', host_id: user_ca.id)

listing_sydney1 = Listing.create!( title: 'Sydney CBD Apartment', street_address: '343 Pitt Street', city: 'Sydney', country_code: 'AU', bed_count: 1, bedroom_count: 1, bathroom_count: 1, description: 'Small apartment', night_fee_cents: '10000', cleaning_fee_cents: '500', host_id: user_s1.id)

listing_sydney2 = Listing.create!( title: 'Sydney CBD Apartment', street_address: '343 Pitt Street', city: 'Sydney', country_code: 'AU', bed_count: 2, bedroom_count: 2, bathroom_count: 1, description: 'Apartment', night_fee_cents: '12000', cleaning_fee_cents: '1000', host_id: user_s2.id)

listing_melbourne_au_1 = Listing.create!( title: 'Melbourne Apartment', street_address: '35 Albert Road', city: 'Melbourne', country_code: 'AU', bed_count: 1, bedroom_count: 1, bathroom_count: 1, description: 'Small apartment', night_fee_cents: '9000', cleaning_fee_cents: '500', host_id: user_m1.id)

listing_melbourne_au_2 = Listing.create!( title: 'Melbourne Apartment', street_address: '318 Lonsdale Street', city: 'Melbourne', country_code: 'AU', bed_count: 1, bedroom_count: 1, bathroom_count: 1, description: 'Small apartment', night_fee_cents: '9500', cleaning_fee_cents: '500', host_id: user_m2.id)

listing_ibiza1 = Listing.create!( title: 'Private Room in Playa Den Bossa', street_address: ' 1 Sant Josep de sa Talaia', city: 'IIIes Balears', country_code: 'ES', bed_count: 2, bedroom_count: 1, bathroom_count:1 , description: 'Near restaurants, shops, supermarkets, bars and nightclubs', night_fee_cents: '12500', cleaning_fee_cents: '4600', host_id: user_i1.id)

listing_ibiza2 = Listing.create!( title: '3 bedroom flat', street_address: '7 Carrer de Galicia', city: 'Ibiza Town', country_code: 'ES', bed_count: 3, bedroom_count: 1, bathroom_count: 1, description: 'Brand new flat next to beach', night_fee_cents: '19500', cleaning_fee_cents: '1600', host_id: user_i2.id)
