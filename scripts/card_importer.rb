require 'elasticsearch'
require 'json'
require 'pp'

client = Elasticsearch::Client.new log: true

json = File.read('data/AllCards.json')
obj = JSON.parse(json)

obj.each do |card|
  pp data = card[1]
  client.index index: "magic", type: "card", id: card[0], body: data, refresh: true
end
