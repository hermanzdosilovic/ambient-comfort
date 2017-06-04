require 'faker'
require 'net/http'
require 'uri'
require 'json'

SLEEP_TIME = 2

url = ARGV[0].to_s.empty? ? 'http://localhost:3000' : ARGV[0]
uri = URI.parse(url + '/logs')
header = { 'Content-Type': 'application/json' }

puts "Sending fake data to #{uri} ..."
while true do
    log = {
        created_at: Time.now,
        temperature: Faker::Number.between(10, 40),
        moisture: Faker::Number.decimal(2, 5),
        pressure: Faker::Number.between(950, 1050).to_i + Faker::Number.decimal(0, 5).to_f,
        brightness: Faker::Number.between(0, 5).to_i + Faker::Number.decimal(0, 5).to_f,
        noise: Faker::Number.between(0, 5).to_i + Faker::Number.decimal(0, 5).to_f
    }
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = log.to_json
    response = http.request(request)
    puts "Request Data: #{log.to_json}\nResponse: #{response.code}\n\n"
    sleep(SLEEP_TIME)
end