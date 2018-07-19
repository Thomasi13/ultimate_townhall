class Finish


  def done_scrapping
    puts "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
    puts "Ca y est c'est terminé, mission accomplie !"
  end

  def over
    puts "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"        #indispensable pour lancer la def over
    puts " Ok, tu ne veux pas, tu préfères quitter ? \nAppuye sur > Q < pour QUITTER, ou > R < pour RECOMMENCER"

    user_answer = gets.chomp.to_s.upcase

    while (user_answer != "Q") && (user_answer != "R")
      puts " Je n'ai pas compris, veux tu continuer ?\nAppuye sur > Q < pour QUITTER, ou > R < pour RECOMMENCER"
      print "> "
      user_answer = gets.chomp
    end

    if user_answer == "Q"    #l'utilisateur a décidé d'arreter le programme
                              #message OVER pour le prevenir que c'est bien terminé
    else
      App.new  #va lancer App et donc relancer l'application
    end
  end
end