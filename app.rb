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



  Index.new.start_scrap

  user_answer = gets.chomp.upcase.to_s       #to_s convertit en string   .upcase convertit en majuscule
   
    while (user_answer != "Y") && (user_answer != "N")
      puts " Je n'ai pas compris, veux tu continuer ?\nSi oui appuye sur > Y < si non appuye sur > N <"
      print "> "
      user_answer = gets.chomp.upcase.to_s
    end

    if user_answer == "Y"  			#si l'utilisateur tape "Y" alors il va ensuite aller chercher la classe Scrapper
      Scrapper.new.perform   	
      Finish.new.done_scrapping
      Index.new.start_adder

      user_answer = gets.chomp.upcase.to_s

      while (user_answer != "Y") && (user_answer != "N")
        puts " Je n'ai pas compris, veux tu continuer ?\nSi oui appuye sur > Y < si non appuye sur > N <"
        print "> "
        user_answer = gets.chomp.upcase.to_s
      end

      if user_answer == "Y"  		#si l'utilisateur tape "Y" alors il va ensuite aller chercher la classe Scrapper
        Townhalls_adder.new.perform  		
        Finish.new.done_scrapping
        Index.new.start_mail
        Index.new.start_follow

        #while (user_answer != "Y") && (user_answer != "N")
          #puts " Je n'ai pas compris, veux tu continuer ? (N pour quitter, Y pour continuer ) "
          #print "> "
          #user_answer = gets.chomp.upcase.to_s
        #end

        #if user_answer == "Y"  		#si l'utilisateur tape "Y" alors il va ensuite aller chercher la classe Scrapper
          #Json.new.send_to_json  		#lance la classe Scrapper
          #Finish.new.done_scrapping
          #Index.new.start_mail

        #elsif user_answer == "N"
          #Done.new

        #end

        	while (user_answer != "Y") && (user_answer != "N")
          	  puts " Je n'ai pas compris, veux tu continuer ?\nSi oui appuye sur > Y < si non appuye sur > N <"
          	  print "> "
          	  user_answer = gets.chomp.upcase.to_s
        	end

        	if user_answer == "Y"  		#si l'utilisateur tape "Y" alors il va ensuite aller chercher la classe Scrapper
          	  Twitters.new.search_user	
          	  Finish.new.done_scrapping
          	  Index.new.start_mail

        	elsif user_answer == "N"
          	  Done.new.over
          	end






      elsif user_answer == "N"
        Done.new.over
      end


    elsif user_answer == "N"
      Done.new.over               		#si l'utilisateur a tapé "N" alors il lance la classe Done qui termine le programme
    end




