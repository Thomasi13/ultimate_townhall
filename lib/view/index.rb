class Index

  def start_scrap
    puts "-------------------------------------------------------------------------------------------------"
		puts "Salut mon pote, ça te dis qu'on récupère les adresses mail de toutes les mairies des départements \nde la Martinique, des Hauts de Seine, et du Territoire de Belfort ?\nSi OUI appuye sur > Y < si NON appuye sur > N <"
    puts "-------------------------------------------------------------------------------------------------\n"
  end

  def start_adder
	 puts "Ça te dis qu'on les mette dans un beau fichier CSV ?\nSi OUI appuye sur > Y < si NON appuye sur > N <"
   puts "-------------------------------------------------------------------------------------------------\n"
  end

  def start_mail
  	puts "\nMaintenant on peut les contacter pour leurs parler de THP, t'es partant ? \nSi OUI appuye sur > Y < si NON appuye sur > N <"
    puts "-------------------------------------------------------------------------------------------------\n"
  end

  def start_follow    
    puts "\nCa y est ton mail est parti à toute la liste, veux-tu les suivres sur Twitter ?\nSi OUI appuye sur > Y < si NON appuye sur > N <"
    puts "-------------------------------------------------------------------------------------------------\n" 
  end
end
