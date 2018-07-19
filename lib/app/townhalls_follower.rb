require 'rubygems'
require 'whenever'
require 'twitter'
require 'dotenv'
Dotenv.load

class Twitters  

  def search_user  # Méthode pour les access keys
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['CONSUM_KEY2']
      config.consumer_secret = ENV['CONSUM_SECRET2']
      config.access_token = ENV['ACCESS_TOKEN2']
      config.access_token_secret = ENV['TOKEN_SECRET2']
    end

    a = $lists_nom   
    n = 0
    x = 0
    user = []
    handle = []

    while x != a.size do

    mots_cles = ["Mairie #{a[n]}"]
    mots_cles.each do |name|

      if client.user_search(name)[0] == nil
        user << " "
      else
        user << client.user_search(name)[0]
      end

    end

  n = n + 1
  x = x + 1
  end

  user.each do |user|
    if user == " "
      puts "user doesn't exist"
    else
      handle << "@"+user.name
    end
  end
  puts handle

  user.each do |commune|
    client.follow(commune)
  end
  end

end

