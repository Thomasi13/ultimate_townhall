class Index

  def start_scrap
    puts "-------------------------------------------------------------------------------------------------"
		puts "Salut mon pote, ça te dis qu'on récupère les adresses mail de toutes les mairies des communes \nde la Seine St Denis, des Hauts de Seine, et des Bouches-du-Rhone ?\nSi oui appuye sur > Y < si non appuye sur > N <"
    puts "-------------------------------------------------------------------------------------------------"
  end

  def start_adder
   puts "-------------------------------------------------------------------------------------------------" 
	 puts "Ça te dis qu'on les mette dans un beau fichier CSV ?\nSi oui appuye sur > Y < si non appuye sur > N <"
   puts "-------------------------------------------------------------------------------------------------"
  end

  def start_mail
    puts "-------------------------------------------------------------------------------------------------"
  	puts "Maintenant on peut les contacter pour leurs parler de THP, t'es partant ? \nVoici le mail que nous t'avons préparé : << Bonjour, je m'appelle Jean-Michel, je suis élève\nà The Hacking Project, une formation au code gratuite, sans locaux, sans sélection,sans restriction géographique. La pédagogie de ntore école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code.\nLe projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.Déjà 500 personnes sont passées par The Hacking Project.\nEst-ce que votre mairie veut changer le monde avec nous ? Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80 >> "
    puts "-------------------------------------------------------------------------------------------------"
  end

  def start_follow
    puts "-------------------------------------------------------------------------------------------------"              #lance la def qui va permettre de follow les comptes Twitter
    puts "Ca y est ton mail est parti à toute la liste, veux-tu les suivres sur Twitter ?\nSi oui appuye sur > Y < si non appuye sur > N <"
    puts "-------------------------------------------------------------------------------------------------" 
  end
end
