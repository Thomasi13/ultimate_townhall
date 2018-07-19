
The Hacking Project - Ultimate Townhall - 19 juillet 2018



Programme réalisée en ruby par l'équipe THP Marseille : 
- Thomas Iatrou ==> thomasi13
- Antoine Litaise ==> alistars13
- Romain Cestari ==> RomainCestari
- Ahmed Bouzid ==> WaraiBeatbox

--------------------------------------------------------------

Ce programme a pour but de récupérer les adresses mail des mairies des communes des départements des Bouches du Rhône (13), des Hauts de Seine (92), Seine St Denis (93). d'enregistrer ces adresses dans un fichier CSV, d'envoyer un mail à chaque adresse de cette liste, et de suivre les comptes Twitter associés à cette liste. 


Arborescence du dossier Ultimate townhall : 

Ultimate_townhall
├── .gitignore
├── .env 
├── README.md
├── Gemfile
├── Gemfile.lock
├── app.rb
├── db
│   └── townhalls.csv
└── lib
    ├── app
    │   ├── townhalls_scrapper.rb
    │   ├── townhalls_mailer.rb
    │   ├── townhalls_adder_to_db.rb
    │   └── townhalls_follower.rb
    └── views
        ├── done.rb
        └── index.rb

.gitignore  ==> permet d'ignorer certains fichiers comme le .env
.env  ==> fichier ignoré par le .gitignore car contient les clés secrètes Twitter
README.md  ==> c'est ce que tu es en train de lire et il sert à une meilleure compréhension du programme
Gemfile  ==> fichier qui contient tous les gems utilisées 
Gemfile.lock  ==> permet de lancer le programme avec exactement les mêmes Gens utilisées la dernière fois qu'il a tourné et fonctionné. 
app.rb  ==> programme qui va lancer Ultimate Townhall
townhalls.csv  ==> tableur qui va contenir toutes les adresses mail, nom des communes et numéro du département 
townhalls_scrapper.rb  ==> 
townhalls_mailer.rb  ==> programme qui va envoyer des mails à toute la liste
townhalls_adder_to_db.rb  ==> programme qui va ajouter les infos scrappées à la datable
townhalls_follower.rb  ==> programme qui va follow tous les comptes Twitter 
done.rb  ==> programme qui ferme l'application quand l'utilisateur le décide
index.rb  ==> programme qui regroupe toutes les classes 

How to use ? 
Le programme s'exécute en ouvrant le fichier app.rb dans le terminal.

Remember : faire un "bundle install" avant de lancer le programme. 

What has been done : 

Voici l'email qui a été envoyé :
"Bonjour,
Je m'appelle [PRÉNOM], je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de ntore école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.

Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de [NOM_COMMUNE] veut changer le monde avec nous ?

Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"

Cet email a été envoyé à "..." de mairies 
Le handle Twitter utilisé est ... 

