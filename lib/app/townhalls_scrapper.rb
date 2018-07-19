#!/usr/bin/ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'pp'


class Scrapper


#-------------------------------------------------------------------------------------------------------------------------
# Departements
#-------------------------------------------------------------------------------------------------------------------------

  def get_Hauts_de_Seine 			# Méthode qui va chercher le département "Hauts_de_Seine" dans la page d'accueil
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com"))
    page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[18]/td[4]/a').each do |node| 	
      @departement =  node['href']  		# Transforme la data en href et range le dans la variable @departement                                        					
    end
    get_all_the_urls_of_the_townhalls(@departement)
  end

  def get_Bouches_du_Rhone			# Méthode qui va chercher le département "Bouches_du_Rhone" dans la page d'accueil
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com")) 
    page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[13]/td[1]/a').each do |node| 
	    @departement =  node['href']  	# Transforme la data en href et range le dans la variable @departement 
    end
    get_all_the_urls_of_the_townhalls(@departement)
  end

  def get_Seine_Saint_Denis			# Méthode qui va chercher le département "Seine_Saint_Denis" dans la page d'accueil
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com"))
    page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[19]/td[4]/a').each do |node| 
	    @departement =  node['href'] 		# Transforme la data en href et range le dans la variable @departement 
    end
    get_all_the_urls_of_the_townhalls(@departement)	 		# Lance la méthode avec la variable @departement 
  end



#-------------------------------------------------------------------------------------------------------------------------
# Scrapp des communes dans chaque page d'un département
#-------------------------------------------------------------------------------------------------------------------------


  def get_all_the_urls_of_the_townhalls(town)
	# Méthode qui va chercher l'URL de chaque commune
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/"+town))
    page.css('a.lientxt').each do |node|
	    @liens = node['href'].slice!(1,1000) 		
	    @nom << node.text

	    get_the_email_of_a_townhal_from_its_webpage(@liens) 			# Lance la méthode avec la variable @liens 
    end
  end


#-------------------------------------------------------------------------------------------------------------------------
# Scrapp des adresses mail et numéro de département dans chaque page d'une commune
#-------------------------------------------------------------------------------------------------------------------------


  def get_the_email_of_a_townhal_from_its_webpage (liens)		

    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/"+liens))
    page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
   	  @adress << node.text
    end

    page.xpath('/html/body/div/main/section[3]/div/table/tbody/tr[1]/td[2]').each do |node|
   	  @number << node.text.slice!(0,2).to_s
    end

  end




#-------------------------------------------------------------------------------------------------------------------------
# Résultat des datas récoltés
#-------------------------------------------------------------------------------------------------------------------------


  def result
  	 @list_number = @number
  	 @list_adress = @adress
  	 @list_nom = @nom
     $lists_nom = @list_nom

   	 @hash_nom_adress = Hash[@list_adress.zip(@list_nom)]

   	 @hash_nom_num = Hash[@list_nom.zip(@list_number)]


      File.open('db/noms_emails.json', 'w') do |f|
        f.write(@hash_nom_adress.to_json )
      end

      File.open('db/noms_num.json', 'w') do |f|
        f.write(@hash_nom_num.to_json )
      end
   	       
  end


#-------------------------------------------------------------------------------------------------------------------------
# Lancement
#-------------------------------------------------------------------------------------------------------------------------

  def perform
  	@adress = []
    @nom = []
    @number = []

    get_Hauts_de_Seine 			#lance la méthode
    get_Bouches_du_Rhone 		#lance la méthode
    get_Seine_Saint_Denis 		#lance la méthode
    result						#lance la méthode
  end

end	