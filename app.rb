#require_relative permet d'appeler les différents fichiers nécessaires au fonctionnement du programme
require_relative 'lib/app/townhalls_scrapper.rb'
require_relative 'lib/app/townhalls_adder_to_db.rb'
#require_relative 'lib/app/townhalls_mailer.rb'
require_relative 'lib/app/townhalls_follower.rb'  
require_relative 'lib/view/done.rb'
require_relative 'lib/view/index.rb'

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'pp'
require 'whenever'
require 'gmail'
require 'twitter'
require 'dotenv'
Dotenv.load

class App

  def get_scrap
  	Scrapper.new.perform   	
  	Finish.new.done_scrapping
  	Index.new.start_adder
  end

  def get_csv
  	Townhalls_adder.new.perform  		
  	Finish.new.done_scrapping
  	Index.new.start_mail
  end

  def get_twitter
  	Twitters.new.search_user	
  	Finish.new.done_scrapping
  	Index.new.start_mail
  end

  def perform

  	Index.new.start_scrap

  	user_answer = gets.chomp.upcase.to_s       # to_s convertit en string   .upcase convertit en majuscule
   
      while (user_answer != "Y") && (user_answer != "N")		# Tant qu'il ne répond pas correctement, relance la boucle
      	puts "-------------------------------------------------------------------------------------------------\n"
        puts " Je n'ai pas compris, veux tu continuer ?\nSi oui appuye sur > Y < si non appuye sur > N <"
        puts "-------------------------------------------------------------------------------------------------\n"
        print "> "
        user_answer = gets.chomp.upcase.to_s
        get_scrap
      end

      if user_answer == "Y" 			#si l'utilisateur tape "Y" alors il va ensuite aller chercher la classe Scrapper
        get_scrap
        user_answer = gets.chomp.upcase.to_s


        while (user_answer != "Y") && (user_answer != "N")	# Tant qu'il ne répond pas correctement, relance la boucle
          puts "-------------------------------------------------------------------------------------------------\n"
          puts " Je n'ai pas compris, veux tu continuer ?\nSi oui appuye sur > Y < si non appuye sur > N <"
          puts "-------------------------------------------------------------------------------------------------\n"
          print "> "
          user_answer = gets.chomp.upcase.to_s

          get_csv
        end

          if user_answer == "Y"  		#si l'utilisateur tape "Y" alors il va ensuite aller chercher la classe Scrapper
      	    get_csv

            Index.new.start_follow

       	    user_answer = gets.chomp.upcase.to_s

        	while (user_answer != "Y") && (user_answer != "N") # 	Tant qu'il ne répond pas correctement, relance la boucle
          	  puts "-------------------------------------------------------------------------------------------------\n"
          	  puts " Je n'ai pas compris, veux tu continuer ?\nSi oui appuye sur > Y < si non appuye sur > N <"
          	  puts "-------------------------------------------------------------------------------------------------\n"
          	  print "> "
          	  user_answer = gets.chomp.upcase.to_s
          	  get_twitter	#lance la méthode get twitter
        	end

        	if user_answer == "Y"  		#si l'utilisateur tape "Y" alors il va ensuite aller chercher la classe Scrapper
       		  get_twitter	#lance la méthode get twitter

        	elsif user_answer == "N"
          	  Done.new.over
          	end

      	  elsif user_answer == "N"
        	Done.new.over
    	  end

        elsif user_answer == "N"
          Done.new.over               		#si l'utilisateur a tapé "N" alors il lance la classe Done qui termine le programme
        end

      end
end

App.new.perform





