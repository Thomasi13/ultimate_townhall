require 'gmail'
require 'dotenv'
Dotenv.load


class EmailSender

  def self.login
    gmail = Gmail.connect(['jeanmi.delatuile@gmail.com'],['jeanmichel']) #LOG TO GMAIL
    puts gmail.logged_in?
  end
  

  def self.send_an_email
    @email= ["iatrou.thomas@gmail.com","thomas_iatrou@hotmail.com","ahmahm@hotmail.co.jp"]
    puts @email
    @email.each do |i|

      gmail.deliver do

        to "#{i}"
        subject "Hey, tu connais THP ?"

          html_part do
            content_type 'text/html; charset=UTF-8'

              @NOM_DE_LA_COMMUNE.each do |v|
                body "<p> Bonjour,
                Je m'appelle Jacquie, une amie de Michel, je suis élève à The Hacking Project, 
                une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. 
                La pédagogie de ntore école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. 
                Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.
                Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de #{'v'} veut changer le monde avec nous ?
                Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80</p>"
              end
          end
      end
    end
  end
  gmail.logout
end