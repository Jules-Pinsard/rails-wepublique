require 'faker'

Comment.destroy_all
User.destroy_all
Category.destroy_all
Mesure.destroy_all
Observation.destroy_all
SubComment.destroy_all
Chatroom.destroy_all

Chatroom.create!

real_users = User.create!([{ email: "j@j.com",
                             first_name: "Julia",
                             last_name: "Pesart",
                             password: "azerty",
                             password_confirmation: "azerty",
                             code: "" },
                           { email: "m@m.com",
                             first_name: "Maelle",
                             last_name: "Lemaitre",
                             password: "azerty",
                             password_confirmation: "azerty",
                             code: "" },
                           { email: "n@n.com",
                             first_name: "Nathalie",
                             last_name: "Tusard",
                             password: "azerty",
                             password_confirmation: "azerty",
                             code: "" },
                           { email: "1@1.com",
                             first_name: "Didier",
                             last_name: "Sanchez",
                             password: "azerty",
                             password_confirmation: "azerty",
                             code: "" },
                           { email: "2@2.com",
                             first_name: "Valérie",
                             last_name: "Tamponne",
                             password: "azerty",
                             password_confirmation: "azerty",
                             code: "" },
                           { email: "3@3.com",
                             first_name: "Luc",
                             last_name: "Bricadelle",
                             password: "azerty",
                             password_confirmation: "azerty",
                             code: "" },
                           { email: "4@4.com",
                             first_name: "Emmanuel",
                             last_name: "Petit",
                             password: "azerty",
                             password_confirmation: "azerty",
                             code: "" },
                           { email: "5@5.com",
                             first_name: "Robert",
                             last_name: "Kubica",
                             password: "azerty",
                             password_confirmation: "azerty",
                             code: "" },
                           { email: "6@6.com",
                             first_name: "Roger",
                             last_name: "Wallon",
                             password: "azerty",
                             password_confirmation: "azerty",
                             code: "" },
                           { email: "7@7.com",
                             first_name: "Julie",
                             last_name: "Robert",
                             password: "azerty",
                             password_confirmation: "azerty",
                             code: "" },
                           { email: "8@8.com",
                             first_name: "Angela",
                             last_name: "Merkel",
                             password: "azerty",
                             password_confirmation: "azerty",
                             code: "ExempleDeCode" },
                           { email: "9@9.com",
                             first_name: "Christianne",
                             last_name: "Taubira",
                             password: "azerty",
                             password_confirmation: "azerty",
                             code: "" },
                           { email: "10@10.com",
                             first_name: "Ségolène",
                             last_name: "Malia",
                             password: "azerty",
                             password_confirmation: "azerty",
                             code: "" }])

fake_users = []
200.times do
  fake_users << User.create!(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: "azerty",
    password_confirmation: "azerty",
    code: ""
  )
end

Category.create!([{ name: "Mobilier" },
                  { name: "Environnement" },
                  { name: "Santé" },
                  { name: "Culture" },
                  { name: "Solidarité" },
                  { name: "Sport" },
                  { name: "Inclusion" },
                  { name: "Jeunesse" },
                  { name: "Finances" },
                  { name: "Patrimoine" },
                  { name: "Tourisme" },
                  { name: "Autre" }])

statuses = ["En cours de concertation", "Validé", "Refusé"]

mesures = [
  {
    title: "Réaménagement de la place du village",
    content: "Proposition de réaménagement de la place centrale du village avec l'installation de bancs, d'espaces verts et d'éclairage moderne.",
    category: Category.find_by(name: "Mobilier"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Création d'une piste cyclable sécurisée",
    content: "Aménagement d'une piste cyclable le long de la route principale pour favoriser les déplacements à vélo et améliorer la sécurité routière.",
    category: Category.find_by(name: "Environnement"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Installation de panneaux solaires sur les bâtiments publics",
    content: "Plan visant à installer des panneaux solaires sur les toits des bâtiments publics pour promouvoir l'énergie renouvelable et réduire les coûts énergétiques.",
    category: Category.find_by(name: "Environnement"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Création d'un parc écologique",
    content: "Création d'un parc écologique avec des sentiers pédestres, des zones de biodiversité et des aires de pique-nique pour promouvoir la préservation de l'environnement.",
    category: Category.find_by(name: "Environnement"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Amélioration des transports en commun",
    content: "Proposition visant à améliorer les transports en commun pour réduire le trafic routier et offrir des options de déplacement plus durables.",
    category: Category.find_by(name: "Inclusion"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Projet de rénovation du centre sportif",
    content: "Rénovation complète du centre sportif local, y compris la modernisation des installations, la création de nouveaux terrains de jeux et l'ajout d'un espace fitness.",
    category: Category.find_by(name: "Sport"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Programme de soutien aux commerces locaux",
    content: "Mise en place d'un programme visant à soutenir les commerces locaux par le biais de subventions, d'événements promotionnels et d'initiatives de marketing collectives.",
    category: Category.find_by(name: "Finances"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Création d'une bibliothèque communautaire",
    content: "Création d'une bibliothèque communautaire moderne avec un large éventail de livres, de ressources éducatives et d'espaces de lecture.",
    category: Category.find_by(name: "Culture"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Aménagement d'un jardin public",
    content: "Transformation d'un espace vacant en un jardin public avec des aires de jeux, des bancs, des jardins communautaires et des espaces de détente.",
    category: Category.find_by(name: "Environnement"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Campagne de sensibilisation à la sécurité routière",
    content: "Lancement d'une campagne de sensibilisation visant à promouvoir la sécurité routière, avec des ateliers éducatifs, des panneaux de signalisation et des initiatives de prévention des accidents.",
    category: Category.find_by(name: "Solidarité"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Projet de rénovation du marché local",
    content: "Rénovation du marché local pour créer un espace moderne, accueillant et adapté aux besoins des producteurs locaux et des habitants.",
    category: Category.find_by(name: "Autre"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Initiative de recyclage communautaire",
    content: "Lancement d'une initiative de recyclage communautaire pour encourager le tri des déchets, la réutilisation et la réduction de la production de déchets.",
    category: Category.find_by(name: "Environnement"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Création d'un festival culturel annuel",
    content: "Organisation d'un festival culturel annuel mettant en avant l'art local, la musique, la cuisine et les traditions pour renforcer le sentiment communautaire.",
    category: Category.find_by(name: "Culture"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Projet d'embellissement des rues",
    content: "Embellissement des rues principales avec l'ajout de plantes, de bancs artistiques, d'œuvres d'art public et d'éclairage esthétique.",
    category: Category.find_by(name: "Mobilier"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Initiative de lutte contre l'isolement social",
    content: "Mise en place d'une initiative visant à lutter contre l'isolement social en encourageant les activités communautaires, les clubs et les événements intergénérationnels.",
    category: Category.find_by(name: "Solidarité"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Installation de bornes de recharge pour véhicules électriques",
    content: "Installation de bornes de recharge pour véhicules électriques afin de soutenir la transition vers des moyens de transport plus durables.",
    category: Category.find_by(name: "Environnement"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Création d'une aire de jeux pour enfants",
    content: "Aménagement d'une aire de jeux moderne pour les enfants, avec des équipements adaptés à tous les âges et des zones ombragées.",
    category: Category.find_by(name: "Jeunesse"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Programme de formation à la prévention des incendies",
    content: "Lancement d'un programme de formation à la prévention des incendies pour sensibiliser la communauté aux risques et promouvoir la sécurité incendie.",
    category: Category.find_by(name: "Santé"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Projet de revitalisation du quartier historique",
    content: "Revitalisation du quartier historique avec la restauration de bâtiments anciens, la création d'un musée local et la promotion du tourisme culturel.",
    category: Category.find_by(name: "Patrimoine"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Campagne de plantation d'arbres",
    content: "Organisation d'une campagne pour planter des arbres dans tout le quartier afin d'améliorer la qualité de l'air et créer un environnement plus vert.",
    category: Category.find_by(name: "Environnement"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Création d'une ludothèque",
    content: "Établissement d'une ludothèque communautaire avec une variété de jeux de société pour encourager le jeu en famille et entre amis.",
    category: Category.find_by(name: "Jeunesse"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Initiative zéro déchet",
    content: "Mise en place d'une initiative visant à réduire les déchets dans le quartier en encourageant le recyclage et l'utilisation de produits durables.",
    category: Category.find_by(name: "Environnement"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Aménagement d'un espace de coworking",
    content: "Création d'un espace de coworking pour les travailleurs indépendants et les entrepreneurs locaux, favorisant ainsi la collaboration et l'innovation.",
    category: Category.find_by(name: "Finances"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Projet de mur d'art communautaire",
    content: "Peinture d'une fresque artistique sur un mur communautaire pour embellir le quartier et promouvoir l'expression artistique.",
    category: Category.find_by(name: "Culture"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Initiative de jardins partagés",
    content: "Création de jardins partagés où les habitants peuvent cultiver des fruits et légumes ensemble, favorisant ainsi la communauté et l'alimentation locale.",
    category: Category.find_by(name: "Solidarité"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Programme de mentorat pour jeunes entrepreneurs",
    content: "Mise en place d'un programme de mentorat visant à soutenir les jeunes entrepreneurs locaux en les mettant en relation avec des mentors expérimentés.",
    category: Category.find_by(name: "Jeunesse"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Projet de rénovation des aires de jeux pour enfants",
    content: "Rénovation des aires de jeux existantes pour les rendre plus sécuritaires, ludiques et adaptées à tous les âges.",
    category: Category.find_by(name: "Jeunesse"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Création d'un marché fermier",
    content: "Organisation d'un marché fermier hebdomadaire pour mettre en avant les produits locaux et soutenir les agriculteurs de la région.",
    category: Category.find_by(name: "Autre"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Réhabilitation d'un bâtiment historique",
    content: "Restauration d'un bâtiment historique pour en faire un centre culturel, préservant ainsi le patrimoine local.",
    category: Category.find_by(name: "Patrimoine"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Réhabilitation d'un espace public abandonné",
    content: "Transformation d'un espace public abandonné en un lieu accueillant avec des bancs, des jardins communautaires et des installations artistiques.",
    category: Category.find_by(name: "Mobilier"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Projet de cinéma en plein air",
    content: "Organisation de séances de cinéma en plein air régulières pour offrir des divertissements aux résidents tout en favorisant la convivialité.",
    category: Category.find_by(name: "Culture"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Création d'un marché bio hebdomadaire",
    content: "Mise en place d'un marché bio hebdomadaire pour promouvoir les produits locaux et encourager une alimentation saine.",
    category: Category.find_by(name: "Autre"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Initiative de réduction des déchets plastiques",
    content: "Campagne visant à réduire l'utilisation de plastique avec des points de collecte et des incitations pour encourager l'utilisation d'alternatives écologiques.",
    category: Category.find_by(name: "Environnement"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Programme de mentorat pour les jeunes entrepreneurs",
    content: "Lancement d'un programme de mentorat pour soutenir les jeunes entrepreneurs locaux en les mettant en relation avec des mentors expérimentés.",
    category: Category.find_by(name: "Jeunesse"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Création d'une aire de détente pour seniors",
    content: "Aménagement d'une aire de détente dédiée aux seniors avec des bancs, des jeux de société et des espaces ombragés.",
    category: Category.find_by(name: "Solidarité"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Projet de mur végétal en centre-ville",
    content: "Installation d'un mur végétal en plein centre-ville pour améliorer la qualité de l'air et ajouter une touche esthétique.",
    category: Category.find_by(name: "Environnement"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Création d'un espace dédié au recyclage électronique",
    content: "Mise en place d'un espace spécifique pour le recyclage électronique afin de minimiser l'impact environnemental des déchets électroniques.",
    category: Category.find_by(name: "Environnement"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Projet d'extension de la bibliothèque",
    content: "Extension de la bibliothèque existante pour offrir plus d'espace, de ressources et de services à la communauté.",
    category: Category.find_by(name: "Culture"),
    status: statuses.sample,
    user: real_users.sample
  },
  {
    title: "Aménagement d'une zone de loisirs pour animaux de compagnie",
    content: "Création d'une zone de loisirs dédiée aux animaux de compagnie avec des parcours d'agilité, des aires de repos et des fontaines d'eau.",
    category: Category.find_by(name: "Jeunesse"),
    status: statuses.sample,
    user: real_users.sample
  }
]

comments = [
  "Pas convaincu du tout. On a d'autres trucs plus urgents à régler, sérieux !",
  "Génial, enfin quelqu'un qui pense à rendre notre quartier plus cool ! 👍",
  "Wouah, c'est une super idée, ça serait trop cool si ça se fait !",
  "Hmm, pas sûr que ça va marcher comme prévu, mais je suis curieux de voir.",
  "Euh, sérieux ? C'est quoi cette idée bizarre...",
  "Bah, je sais pas trop quoi en penser. Ça me laisse perplexe.",
  "Belle initiative, mais tu crois vraiment que ça va passer le vote ?",
  "J'adore l'idée, mais ça risque pas de coûter un bras ?",
  "Franchement, c'est pas mal du tout ! Ça ferait un bon changement.",
  "On devrait en parler autour d'une bière à la prochaine réunion de quartier.",
  "C'est sympa, mais j'espère qu'on va pas se retrouver avec des travaux partout.",
  "Top ! Enfin quelqu'un qui pense à l'avenir de la ville.",
  "Je suis partagé entre 'Pourquoi pas ?' et 'Ça me semble un peu fou'.",
  "Wow, ça serait ouf si on arrive à mettre ça en place !",
  "Eh bien, c'est différent, c'est sûr. On verra bien ce que ça donne.",
  "Pas mal, mais tu crois que ça va vraiment changer quelque chose ?",
  "Grosse fan de l'idée ! J'espère que ça va se concrétiser.",
  "Hum, je pense qu'il faut voir ça de plus près avant de crier victoire.",
  "C'est cool que quelqu'un propose des trucs comme ça. Faudrait plus d'idées comme ça !",
  "Je kiffe l'idée, mais faudrait voir si tout le monde est à bord.",
  "Franchement, je vois pas l'intérêt. On a déjà tout ce qu'il nous faut, non ?",
  "Ouais, pourquoi pas. On verra si ça passe le cap des discussions.",
  "C'est sympa, mais j'espère qu'on va pas se retrouver avec des impôts en plus...",
  "Je suis mitigé. Ça pourrait être cool, mais ça pourrait aussi être un gros flop.",
  "C'est ouf de voir des propositions comme ça. On devrait encourager plus d'initiatives !"
]

sub_comments = [
  "Vrai, on n'a pas que ça à gérer, mais ça pourrait rendre le coin plus sympa, non ? 😄",
  "Trop cool que tu sois hypé ! On a besoin de bonnes vibes dans le quartier. 👏",
  "Ouais, ça serait trop cool si ça se fait ! On croise les doigts. 🤞",
  "Ahah, l'avenir nous le dira ! Tant que c'est pas trop le bazar. 😅",
  "C'est vrai, ça sonne bizarre au début, mais imagine le changement !",
  "Haha, ça laisse perplexe, mais parfois les idées les plus folles sont les meilleures.",
  "Vote ou pas, c'est bien d'avoir des idées qui bougent, tu trouves pas ?",
  "Bras, jambes, on verra bien ! 😂 Mais ouais, on mérite un peu de changement.",
  "Changement = bien. Faut pimenter un peu la vie, non ? 😎",
  "Bière à la main, on discute de ça à la prochaine réu ! 🍻",
  "Espérons qu'on ne finisse pas en mode chantier partout ! 😬",
  "L'avenir de la ville, c'est nous ! 😄 Faut penser grand.",
  "Haha, entre fou et cool, y'a qu'un pas ! 🚀",
  "Ce serait ouf, non ? On croise les doigts ! 🎉",
  "On verra bien ce que ça donne. Le changement, c'est la vie ! 😊",
  "Changer quelque chose, même petit, c'est déjà cool, non ? 🌟",
  "Fan power ! On veut que ça se concrétise aussi. 💪",
  "De près ou de loin, tant qu'on regarde, c'est cool ! 😄",
  "Plus d'idées, plus de fun ! 💡 L'avenir est entre nos mains.",
  "À bord ou pas, faut kiffer les nouvelles idées, non ? 😜",
  "On a tout, mais un peu plus de fun, c'est toujours bien ! 😄",
  "Cap des discussions, cap des découvertes ! On teste ? 🚀",
  "Impôts en plus ? On espère que non ! 😅",
  "Mitigé, flop ou top, l'important c'est d'essayer, non ? 💪",
  "Initiatives = cool ! On devrait tous en proposer plus souvent. 🚀"
]

created_mesures = Mesure.create!(mesures)

Mesure.all.each do |mesure|
  [rand(0..3), rand(0..3), rand(0..3), rand(8..37), rand(40..100), rand(200..300), rand(500..800)].sample.times do
    mesure.liked_by(fake_users.sample)
  end
end

un_peu = [0, 0, 0, 1, 2]

pas_beaucoup = [0, 0, 1, 2, 3]

pas_mal = [0, 0, 0, 0, 1, 2, 3, 4]

beaucoup = [0, 0, 0, 1, 2, 3, 5, 7]

created_mesures.each do |mesure|
  real_users_except_current = real_users.reject { |user| user.id == mesure[:user_id] }
  rand(0..5).times do
    Comment.create!(
      content: comments.sample,
      user: real_users_except_current.sample,
      mesure_id: mesure[:id]
    )
  end
end

Comment.all.each do |comment|
  beaucoup.sample.times do
    comment.liked_by real_users.sample
  end
  pas_beaucoup.sample.times do
    comment.downvote_from real_users.sample
  end
  real_users_except_current = real_users.reject { |user| user.id == comment[:user_id] }
  rand(0..2).times do
    SubComment.create!(
      content: sub_comments.sample,
      user: real_users_except_current.sample,
      comment_id: comment.id
    )
  end
end

SubComment.all.each do |sub_comment|
  pas_mal.sample.times do
    sub_comment.liked_by real_users.sample
  end
  un_peu.sample.times do
    sub_comment.downvote_from real_users.sample
  end
end

observations = [
  {
    title: "Problème de signalisation manquante à l'intersection",
    location: "Rue Gaston Bachelard, 52100 Saint-Dizier",
    description: "L'intersection de la rue de la Libération et de l'avenue des Cerisiers n'a pas de panneau stop, ce qui crée une situation dangereuse. Une signalisation appropriée est nécessaire.",
    category: Category.find_by(name: "Mobilier"),
    dangerosity: rand(1..5),
    user: real_users.sample
  },
  {
    title: "Dégradation des espaces verts du parc municipal",
    location: "Av. de Belle Forêt-sur-Marne, 52100 Saint-Dizier, 52100 Saint-Dizier",
    description: "Les espaces verts du parc municipal sont mal entretenus. Des déchets sont dispersés, et les bancs sont vandalisés. Un nettoyage et des réparations sont nécessaires.",
    category: Category.find_by(name: "Patrimoine"),
    dangerosity: rand(1..5),
    user: real_users.sample
  },
  {
    title: "Nid-de-poule sur la route principale",
    location: "Rue de l'Epinotte, 52100 Saint-Dizier",
    description: "Un grand nid-de-poule s'est formé sur la route principale près du supermarché. Cela endommage les voitures et représente un risque pour la circulation.",
    category: Category.find_by(name: "Inclusion"),
    dangerosity: rand(1..5),
    user: real_users.sample
  },
  {
    title: "Bancs publics endommagés par la météo",
    location: "Rue George Sand, 52100 Saint-Dizier",
    description: "Les bancs le long de la rivière ont été fortement affectés par les intempéries. Le bois est pourri, et certains bancs sont devenus dangereux. Une réparation est urgente.",
    category: Category.find_by(name: "Mobilier"),
    dangerosity: rand(1..5),
    user: real_users.sample
  },
  {
    title: "Déversement de produits chimiques près de l'école",
    location: "Rue du Brigadier Albert, 52100 Saint-Dizier",
    description: "Des produits chimiques ont été déversés près de l'école primaire. Cela représente un risque potentiel pour la santé des enfants. L'intervention immédiate des autorités est requise.",
    category: Category.find_by(name: "Santé"),
    dangerosity: rand(1..5),
    user: real_users.sample
  },
  {
    title: "Lampadaire clignotant dans le quartier résidentiel",
    location: "Rue du Marche, 52100 Saint-Dizier",
    description: "Un lampadaire dans le quartier résidentiel clignote de manière intermittente la nuit. Cela crée de l'inconfort pour les résidents. Une réparation rapide est nécessaire.",
    category: Category.find_by(name: "Mobilier"),
    dangerosity: rand(1..5),
    user: real_users.sample
  },
  {
    title: "Défaut d'éclairage dans l'allée du parc",
    location: "Rue de la Tambourine, 52100 Saint-Dizier",
    description: "L'éclairage dans l'allée du parc ne fonctionne pas correctement, créant des zones sombres et potentiellement dangereuses la nuit. Une réparation immédiate est demandée.",
    category: Category.find_by(name: "Santé"),
    dangerosity: rand(1..5),
    user: real_users.sample
  },
  {
    title: "Arbres malades dans le square des Tulipes",
    location: "Rue de Bourgogne, 52100 Saint-Dizier",
    description: "Certains arbres dans le square des Tulipes semblent malades. Un arboriculteur devrait être consulté pour évaluer la situation et prendre des mesures appropriées.",
    category: Category.find_by(name: "Environnement"),
    dangerosity: rand(1..5),
    user: real_users.sample
  },
  {
    title: "Défaut d'entretien des aires de jeu pour enfants",
    location: "Rue Jean Cassou, 52100 Saint-Dizier",
    description: "Les aires de jeu pour enfants ont besoin d'un entretien urgent. Les balançoires grincent, et les surfaces en caoutchouc sont endommagées. La sécurité des enfants est compromise.",
    category: Category.find_by(name: "Jeunesse"),
    dangerosity: rand(1..5),
    user: real_users.sample
  },
  {
    title: "Tag sur les murs du centre culturel",
    location: "Rue Roger Michelot, 52100 Saint-Dizier",
    description: "Des graffitis ont été apposés sur les murs du centre culturel. Cela nuit à l'apparence esthétique du bâtiment. Un nettoyage est requis.",
    category: Category.find_by(name: "Patrimoine"),
    dangerosity: rand(1..5),
    user: real_users.sample
  },
  {
    title: "Fuites d'eau près du stade de sport",
    location: "Rue Roger Martin du Gard, 52100 Saint-Dizier",
    description: "Des fuites d'eau ont été détectées près du stade de sport. Cela crée des flaques d'eau et peut affecter la qualité du terrain de jeu.",
    category: Category.find_by(name: "Sport"),
    dangerosity: rand(1..5),
    user: real_users.sample
  },
  {
    title: "Stationnement sauvage devant l'école secondaire",
    location: "Rue Valentina Terechkova, 52100 Saint-Dizier",
    description: "Les parents se garent de manière chaotique devant l'école secondaire, créant des problèmes de circulation et de sécurité. Des mesures de régulation sont nécessaires.",
    category: Category.find_by(name: "Jeunesse"),
    dangerosity: rand(1..5),
    user: real_users.sample
  },
  {
    title: "Poubelles publiques débordantes sur la place du marché",
    location: "Rue Philippe Charbonneaux, 52100 Saint-Dizier",
    description: "Les poubelles publiques sur la place du marché débordent de déchets. Cela crée une mauvaise image et peut attirer les animaux nuisibles.",
    category: Category.find_by(name: "Tourisme"),
    dangerosity: rand(1..5),
    user: real_users.sample
  },
  {
    title: "Fenêtres cassées à la bibliothèque municipale",
    location: "Rue Paul Verlaine, 52100 Saint-Dizier",
    description: "Plusieurs fenêtres de la bibliothèque municipale sont brisées. Cela compromet la sécurité du bâtiment et nécessite des réparations immédiates.",
    category: Category.find_by(name: "Culture"),
    dangerosity: rand(1..5),
    user: real_users.sample
  },
  {
    title: "Sentier de randonnée envahi par la végétation",
    location: "Rue Paul Cezanne, 52100 Saint-Dizier",
    description: "Le sentier de randonnée près du bois est envahi par la végétation, rendant la marche difficile. Un débroussaillage est nécessaire.",
    category: Category.find_by(name: "Environnement"),
    dangerosity: rand(1..5),
    user: real_users.sample
  },
  {
    title: "Défaut d'éclairage dans le parking du centre commercial",
    location: "Rue Paul Bert, 52100 Saint-Dizier",
    description: "Certains lampadaires dans le parking du centre commercial ne fonctionnent pas correctement, créant des zones sombres. Cela affecte la sécurité des clients.",
    category: Category.find_by(name: "Santé"),
    dangerosity: rand(1..5),
    user: real_users.sample
  },
  {
    title: "Accès handicapé bloqué devant la mairie",
    location: "Rue Olof Palme, 52100 Saint-Dizier",
    description: "L'accès handicapé devant la mairie est bloqué en raison de travaux de construction. Une signalisation appropriée est nécessaire pour diriger les personnes handicapées vers un autre itinéraire.",
    category: Category.find_by(name: "Inclusion"),
    dangerosity: rand(1..5),
    user: real_users.sample
  },
  {
    title: "Véhicules abandonnés dans la rue des Cerisiers",
    location: "Rue Notre Dame, 52100 Saint-Dizier",
    description: "Plusieurs véhicules semblent abandonnés dans la rue des Cerisiers. Cela peut causer des problèmes de stationnement et de circulation.",
    category: Category.find_by(name: "Autre"),
    dangerosity: rand(1..5),
    user: real_users.sample
  },
  {
    title: "Inondation mineure après une pluie intense",
    location: "Rue Mozart, 52100 Saint-Dizier",
    description: "Après une forte pluie, certaines rues ont été inondées en raison d'un mauvais drainage. Des améliorations sont nécessaires pour éviter de futurs problèmes d'inondation.",
    category: Category.find_by(name: "Autre"),
    dangerosity: rand(1..5),
    user: real_users.sample
  },
  {
    title: "Défaillance des feux de circulation à l'intersection principale",
    location: "Rue Montpensier, 52100 Saint-Dizier",
    description: "Les feux de circulation à l'intersection principale ne fonctionnent pas correctement, créant des embouteillages et des situations dangereuses. Une réparation urgente est demandée.",
    category: Category.find_by(name: "Autre"),
    dangerosity: rand(1..5),
    user: real_users.sample
  }
]

Observation.create!(observations)
