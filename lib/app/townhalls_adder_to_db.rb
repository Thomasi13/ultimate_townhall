require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'pp'
require "google_drive"
require 'csv'
require_relative "townhalls_scrapper.rb"



class Townhalls_adder

  def ruby_to_json # methode qui passe de rubby à JSON

	Scrapper.new.perform #lance la class Scrapper ( dans le fichier townhalls_scrapper.rb)

  end

  def json_to_spreadsheet  #methode qui transfert le JSON à Google Sheet

	json = File.read('db/noms_emails.json') #lie le fichier email.json
	obj = JSON.parse(json)
	obj

	json = File.read('db/noms_num.json') #lie le fichier email.json
	obj1 = JSON.parse(json)
	obj1		

	session = GoogleDrive::Session.from_config("config.json")  #paramètre personnel de google
	ws = session.spreadsheet_by_key("1ADimUBszp7Zqx-neA02Pt5613zeQulr3s9o8q4pFJMo").worksheets[0]

	i = 1	# compteur commence à 1
	obj.each do |k=nil,v=nil| # Pour chaque objet du tableau, k équivaut adresses, v équivaut aux noms
      ws[i, 3] = k    # Met dans la colonne 3 les adresses (k)
      ws[i, 2] = v	# Met dans la colonne 2 les noms (v)
      i += 1  
	end

	i = 1	# compteur commence à 1
	obj1.each do |x=nil,y=nil| # Pour chaque objet du tableau, x équivaut aux numéros de département, y équivaut aux noms
      ws[i, 2] = x    # Met dans la colonne 2 numéros de département (x)
      ws[i, 1] = y	# Met dans la colonne 1 les noms (y)
      i += 1
	end

	ws.save		# Sauvegarde, et met à jour le google Sheet

	CSV.open("db/townhalls.csv", "wb") {|csv| obj.each { |item| csv << item }}
  end


  def perform # Méthode qui lance les méthodes
	ruby_to_json # Lance la méthode	
	json_to_spreadsheet # Lance la méthode
  end

end
