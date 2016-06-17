class Project < ActiveRecord::Base
  # AREA = [
  #   'Travailler',
  #   'Me former',
  #   'Me loger',
  #   "Partir à l'étranger",
  #   'Me soigner'
  # ]

  KNOWLEDGE_QUESTIONS = [
    'Je sais quelle formation je veux suivre',
    'Je veux découvrir des domaines de formation possibles'
  ].freeze

  DOMAINES = PROFESSIONS = FORMATIONS = [
    "Conduite d'engins d'exploitation agricole et forestière",
    "Bûcheronnage et élagage",
    "Entretien des espaces naturels",
    "Entretien des espaces verts",
    "Protection du patrimoine naturel",
    "Sylviculture",
    "Conseil et assistance technique en agriculture",
    "Contrôle et diagnostic technique en agriculture",
    "Ingénierie en agriculture et environnement naturel",
    "Aide agricole de production fruitière ou viticole",
    "Aide agricole de production légumière ou végétale",
    "Aide d'élevage agricole et aquacole",
    "Aquaculture",
    "Arboriculture et viticulture",
    "Encadrement équipage de la pêche",
    "Élevage bovin ou équin",
    "Élevage d'animaux sauvages ou de compagnie",
    "Élevage de lapins et volailles",
    "Élevage ovin ou caprin",
    "Élevage porcin",
    "Fabrication et affinage de fromages",
    "Fermentation de boissons alcoolisées",
    "Horticulture et maraîchage",
    "Equipage de la pêche",
    "Polyculture, élevage",
    "Saliculture",
    "Aide aux soins animaux",
    "Podologie animale",
    "Toilettage des animaux",
    "Santé animale",
    "Création en arts plastiques",
    "Réalisation d'objets décoratifs et utilitaires en céramique et matériaux de synthèse",
    "Décoration d'espaces de vente",
    "Décoration d'objets d'art et artisanaux",
    "Gravure - ciselure",
    "Réalisation d'objets en lianes, fibres et brins végétaux",
    "Reliure et restauration de livres et archives",
    "Fabrication et réparation d'instruments de musique",
    "Métallerie d'art",
    "Réalisation d'objets artistiques et fonctionnels en verre",
    "Réalisation d'ouvrages en bijouterie, joaillerie et orfèvrerie",
    "Réparation - montage en systèmes horlogers",
    "Conservation et reconstitution d'espèces animales",
    "Réalisation d'articles de chapellerie",
    "Réalisation d'articles en cuir et matériaux souples (hors vêtement)",
    "Réalisation de vêtements sur mesure ou en petite série",
    "Réalisation d'ouvrages d'art en fils",
    "Stylisme",
    "Tapisserie - décoration en ameublement",
    "Conception - développement produits d'assurances",
    "Conseil clientèle en assurances",
    "Courtage en assurances",
    "Direction d'exploitation en assurances",
    "Études actuarielles en assurances",
    "Expertise risques en assurances",
    "Indemnisations en assurances",
    "Management de groupe et de service en assurances",
    "Rédaction et gestion en assurances",
    "Souscription d'assurances",
    "Accueil et services bancaires",
    "Analyse de crédits et risques bancaires",
    "Relation clients banque/finance",
    "Conception et expertise produits bancaires et financiers",
    "Conseil en gestion de patrimoine financier",
    "Gestion de clientèle bancaire",
    "Management en exploitation bancaire",
    "Front office marchés financiers",
    "Gestion back et middle-office marchés financiers",
    "Gestion de portefeuilles sur les marchés financiers",
    "Gestion en banque et assurance",
    "Gérance immobilière",
    "Gestion locative immobilière",
    "Management de projet immobilier",
    "Transaction immobilière",
    "Boucherie",
    "Boulangerie - viennoiserie",
    "Charcuterie - traiteur",
    "Pâtisserie, confiserie, chocolaterie et glacerie",
    "Poissonnerie",
    "Vente en alimentation",
    "Vente en gros de produits frais",
    "Achat vente d'objets d'art, anciens ou d'occasion",
    "Coiffure",
    "Hydrothérapie",
    "Location de véhicules ou de matériel de loisirs",
    "Nettoyage d'articles textiles ou cuirs",
    "Réparation d'articles en cuir et matériaux souples",
    "Retouches en habillement",
    "Soins esthétiques et corporels",
    "Vente de végétaux",
    "Vente en animalerie",
    "Vente en articles de sport et loisirs",
    "Vente en décoration et équipement du foyer",
    "Vente en gros de matériel et équipement",
    "Vente en habillement et accessoires de la personne",
    "Management de magasin de détail",
    "Assistanat commercial",
    "Relation commerciale grands comptes et entreprises",
    "Relation commerciale auprès de particuliers",
    "Relation commerciale en vente de véhicules",
    "Conseil en information médicale",
    "Management en force de vente",
    "Relation technico-commerciale",
    "Téléconseil et télévente",
    "Animation de vente",
    "Management/gestion de rayon produits alimentaires",
    "Management/gestion de rayon produits non alimentaires",
    "Direction de magasin de grande distribution",
    "Personnel de caisse",
    "Marchandisage",
    "Mise en rayon libre-service",
    "Encadrement du personnel de caisses",
    "Management de département en grande distribution",
    "Animation de site multimédia",
    "Ecriture d'ouvrages, de livres",
    "Communication",
    "Conception de contenus multimédias",
    "Coordination d'édition",
    "Journalisme et information média",
    "Organisation d'événementiel",
    "Traduction, interprétariat",
    "Photographie",
    "Production en laboratoire cinématographique",
    "Production en laboratoire photographique",
    "Projection cinéma",
    "Réalisation de contenus multimédias",
    "Conduite de machines d'impression",
    "Conduite de machines de façonnage routage",
    "Encadrement des industries graphiques",
    "Façonnage et routage",
    "Préparation et correction en édition et presse",
    "Prépresse",
    "Reprographie",
    "Intervention technique en industrie graphique",
    "Développement et promotion publicitaire",
    "Élaboration de plan média",
    "Architecture du BTP",
    "Conception - aménagement d'espaces intérieurs",
    "Contrôle et diagnostic technique du bâtiment",
    "Dessin BTP",
    "Études géologiques",
    "Ingénierie et études du BTP",
    "Mesures topographiques",
    "Métré de la construction",
    "Conduite de travaux du BTP",
    "Direction de chantier du BTP",
    "Direction et ingénierie d'exploitation de gisements et de carrières",
    "Sécurité et protection santé du BTP",
    "Conduite de grue",
    "Conduite d'engins de terrassement et de carrière",
    "Extraction liquide et gazeuse",
    "Extraction solide",
    "Montage de structures et de charpentes bois",
    "Montage de structures métalliques",
    "Réalisation - installation d'ossatures bois",
    "Application et décoration en plâtre, stuc et staff",
    "Électricité bâtiment",
    "Installation d'équipements sanitaires et thermiques",
    "Montage d'agencements",
    "Montage de réseaux électriques et télécoms",
    "Peinture en bâtiment",
    "Pose de fermetures menuisées",
    "Pose de revêtements rigides",
    "Pose de revêtements souples",
    "Pose et restauration de couvertures",
    "Réalisation et restauration de façades",
    "Taille et décoration de pierres",
    "Travaux d'étanchéité et d'isolation",
    "Construction en béton",
    "Construction de routes et voies",
    "Maçonnerie",
    "Préparation du gros oeuvre et des travaux publics",
    "Pose de canalisations",
    "Préfabrication en béton industriel",
    "Accueil touristique",
    "Promotion du tourisme local",
    "Accompagnement de voyages, d'activités culturelles ou sportives",
    "Animation d'activités culturelles ou ludiques",
    "Animation de loisirs auprès d'enfants ou d'adolescents",
    "Éducation en activités sportives",
    "Personnel d'attractions ou de structures de loisirs",
    "Personnel technique des jeux",
    "Conception de produits touristiques",
    "Optimisation de produits touristiques",
    "Vente de voyages",
    "Assistance de direction d'hôtel-restaurant",
    "Management d'hôtel-restaurant",
    "Gestion de structure de loisirs ou d'hébergement touristique",
    "Management d'établissement de restauration collective",
    "Personnel d'étage",
    "Personnel polyvalent d'hôtellerie",
    "Management du personnel d'étage",
    "Management du personnel de cuisine",
    "Personnel de cuisine",
    "Personnel polyvalent en restauration",
    "Fabrication de crêpes ou pizzas",
    "Plonge en restauration",
    "Conciergerie en hôtellerie",
    "Personnel du hall",
    "Réception en hôtellerie",
    "Café, bar brasserie",
    "Management du service en restauration",
    "Service en restauration",
    "Sommellerie",
    "Assistance et support technique client",
    "Management et ingénierie d'affaires",
    "Conception et dessin de produits électriques et électroniques",
    "Conception et dessin produits mécaniques",
    "Design industriel",
    "Études - modèles en industrie des matériaux souples",
    "Expertise technique couleur en industrie",
    "Intervention technique en études et conception en automatisme",
    "Intervention technique en études et développement électronique",
    "Intervention technique en études, recherche et développement",
    "Management et ingénierie études, recherche et développement industriel",
    "Rédaction technique",
    "Inspection de conformité",
    "Intervention technique en hygiène sécurité environnement (HSE) industriel",
    "Management et ingénierie en hygiène sécurité environnement (HSE) industriel",
    "Abattage et découpe des viandes",
    "Conduite d'équipement de production alimentaire",
    "Assemblage d'ouvrages en bois",
    "Conduite d'équipement de fabrication de l'ameublement et du bois",
    "Conduite d'installation de production de panneaux bois",
    "Encadrement des industries de l'ameublement et du bois",
    "Intervention technique en ameublement et bois",
    "Première transformation de bois d'oeuvre",
    "Réalisation d'ouvrages décoratifs en bois",
    "Réalisation de menuiserie bois et tonnellerie",
    "Réalisation de meubles en bois",
    "Conduite d'équipement de production chimique ou pharmaceutique",
    "Assemblage - montage d'articles en cuirs, peaux",
    "Assemblage - montage de vêtements et produits textiles",
    "Conduite de machine d'impression textile",
    "Conduite de machine de fabrication de produits textiles",
    "Conduite de machine de production et transformation des fils",
    "Conduite de machine de textiles nontissés",
    "Conduite de machine de traitement textile",
    "Conduite de machine de transformation et de finition des cuirs et peaux",
    "Contrôle en industrie du cuir et du textile",
    "Coupe cuir, textile et matériaux souples",
    "Mise en forme, repassage et finitions en industrie textile",
    "Montage de prototype cuir et matériaux souples",
    "Patronnage - gradation",
    "Préparation de fils, montage de métiers textiles",
    "Préparation et finition d'articles en cuir et matériaux souples",
    "Encadrement d'équipe en industrie de transformation",
    "Encadrement d'équipe ou d'atelier en matériaux souples",
    "Encadrement de production de matériel électrique et électronique",
    "Management et ingénierie de production",
    "Pilotage d'unité élémentaire de production mécanique",
    "Bobinage électrique",
    "Câblage électrique et électromécanique",
    "Conduite d'installation automatisée de production électrique, électronique et microélectronique",
    "Montage de produits électriques et électroniques",
    "Montage et câblage électronique",
    "Pilotage d'installation énergétique et pétrochimique",
    "Conduite d'équipement de transformation du verre",
    "Conduite d'installation de production de matériaux de construction",
    "Façonnage et émaillage en industrie céramique",
    "Pilotage d'installation de production verrière",
    "Pilotage de centrale à béton prêt à l'emploi, ciment, enrobés et granulats",
    "Ajustement et montage de fabrication",
    "Chaudronnerie - tôlerie",
    "Conduite d'équipement d'usinage",
    "Conduite d'équipement de déformation des métaux",
    "Conduite d'équipement de formage et découpage des matériaux",
    "Conduite d'installation automatisée ou robotisée de fabrication mécanique",
    "Conduite d'installation de production des métaux",
    "Modelage de matériaux non métalliques",
    "Montage-assemblage mécanique",
    "Moulage sable",
    "Réalisation de structures métalliques",
    "Réalisation et montage en tuyauterie",
    "Réglage d'équipement de production industrielle",
    "Soudage manuel",
    "Intervention technique en gestion industrielle et logistique",
    "Intervention technique en méthodes et industrialisation",
    "Management et ingénierie gestion industrielle et logistique",
    "Management et ingénierie méthodes et industrialisation",
    "Conduite d'équipement de fabrication de papier ou de carton",
    "Conduite d'installation de pâte à papier",
    "Conduite d'équipement de formage des plastiques et caoutchoucs",
    "Fabrication de pièces en matériaux composites",
    "Réglage d'équipement de formage des plastiques et caoutchoucs",
    "Conduite d'équipement de conditionnement",
    "Opérations manuelles d'assemblage, tri ou emballage",
    "Préparation de matières et produits industriels (broyage, mélange, )",
    "Direction de laboratoire d'analyse industrielle",
    "Intervention technique en contrôle essai qualité en électricité et électronique",
    "Intervention technique en formulation et analyse sensorielle",
    "Intervention technique en laboratoire d'analyse industrielle",
    "Intervention technique qualité en mécanique et travail des métaux",
    "Management et ingénierie qualité industrielle",
    "Conduite de traitement d'abrasion de surface",
    "Conduite de traitement par dépôt de surface",
    "Conduite de traitement thermique",
    "Peinture industrielle",
    "Direction et ingénierie en entretien infrastructure et bâti",
    "Management et ingénierie de maintenance industrielle",
    "Supervision d'entretien et gestion de véhicules",
    "Entretien d'affichage et mobilier urbain",
    "Entretien et surveillance du tracé routier",
    "Maintenance des bâtiments et des locaux",
    "Installation et maintenance d'ascenseurs",
    "Installation et maintenance d'automatismes",
    "Installation et maintenance d'équipements industriels et d'exploitation",
    "Installation et maintenance de distributeurs automatiques",
    "Installation et maintenance électronique",
    "Installation et maintenance en froid, conditionnement d'air",
    "Installation et maintenance télécoms et courants faibles",
    "Maintenance d'installation de chauffage",
    "Maintenance électrique",
    "Maintenance mécanique industrielle",
    "Maintenance informatique et bureautique",
    "Réparation de biens électrodomestiques",
    "Intervention en grande hauteur",
    "Intervention en milieu subaquatique",
    "Intervention en milieux et produits nocifs",
    "Installation et maintenance en nautisme",
    "Maintenance d'aéronefs",
    "Maintenance d'engins de chantier, levage, manutention et de machines agricoles",
    "Mécanique automobile",
    "Mécanique de marine",
    "Réparation de carrosserie",
    "Réparation de cycles, motocycles et motoculteurs de loisirs",
    "Médecine de prévention",
    "Médecine dentaire",
    "Médecine généraliste et spécialisée",
    "Suivi de la grossesse et de l'accouchement",
    "Biologie médicale",
    "Pharmacie",
    "Aide en puériculture",
    "Analyses médicales",
    "Assistance médico-technique",
    "Conduite de véhicules sanitaires",
    "Imagerie médicale",
    "Personnel polyvalent des services hospitaliers",
    "Préparation en pharmacie",
    "Audioprothèses",
    "Diététique",
    "Ergothérapie",
    "Kinésithérapie",
    "Optique - lunetterie",
    "Orthophonie",
    "Orthoptique",
    "Ostéopathie et chiropraxie",
    "Pédicurie et podologie",
    "Prothèses dentaires",
    "Prothèses et orthèses",
    "Rééducation en psychomotricité",
    "Coordination de services médicaux ou paramédicaux",
    "Soins d'hygiène, de confort du patient",
    "Soins infirmiers généralistes",
    "Soins infirmiers spécialisés en anesthésie",
    "Soins infirmiers spécialisés en bloc opératoire",
    "Soins infirmiers spécialisés en prévention",
    "Soins infirmiers spécialisés en puériculture",
    "Accompagnement et médiation familiale",
    "Aide aux bénéficiaires d'une mesure de protection juridique",
    "Développement personnel et bien-être de la personne",
    "Psychologie",
    "Action sociale",
    "Éducation de jeunes enfants",
    "Encadrement technique en insertion professionnelle",
    "Facilitation de la vie sociale",
    "Information et médiation sociale",
    "Intervention socioculturelle",
    "Intervention socioéducative",
    "Accompagnement médicosocial",
    "Assistance auprès d'adultes",
    "Assistance auprès d'enfants",
    "Intervention sociale et familiale",
    "Services domestiques",
    "Conception et pilotage de la politique des pouvoirs publics",
    "Conseil en Santé Publique",
    "Management de structure de santé, sociale ou pénitentiaire",
    "Mise en oeuvre et pilotage de la politique des pouvoirs publics",
    "Représentation de l'Etat sur le territoire national ou international",
    "Application des règles financières publiques",
    "Contrôle et inspection des Affaires Sociales",
    "Contrôle et inspection des impôts",
    "Contrôle et inspection du Trésor Public",
    "Protection des consommateurs et contrôle des échanges commerciaux",
    "Gestion de l'information et de la documentation",
    "Gestion de patrimoine culturel",
    "Direction de la sécurité civile et des secours",
    "Direction opérationnelle de la défense",
    "Management de la sécurité publique",
    "Personnel de la Défense",
    "Sécurité civile et secours",
    "Sécurité publique",
    "Surveillance municipale",
    "Conseil en emploi et insertion socioprofessionnelle",
    "Développement local",
    "Aide et médiation judiciaire",
    "Collaboration juridique",
    "Défense et conseil juridique",
    "Magistrature",
    "Conseil en formation",
    "Coordination pédagogique",
    "Direction d'établissement et d'enseignement",
    "Éducation et surveillance au sein d'établissements d'enseignement",
    "Enseignement artistique",
    "Enseignement des écoles",
    "Enseignement général du second degré",
    "Enseignement supérieur",
    "Enseignement technique et professionnel",
    "Formation en conduite de véhicules",
    "Formation professionnelle",
    "Orientation scolaire et professionnelle",
    "Blanchisserie industrielle",
    "Lavage de vitres",
    "Management et inspection en propreté de locaux",
    "Nettoyage de locaux",
    "Distribution et assainissement d'eau",
    "Management et inspection en environnement urbain",
    "Nettoyage des espaces urbains",
    "Revalorisation de produits industriels",
    "Salubrité et traitement de nuisibles",
    "Supervision d'exploitation éco-industrielle",
    "Recherche en sciences de l'homme et de la société",
    "Recherche en sciences de l'univers, de la matière et du vivant",
    "Gardiennage de locaux",
    "Management de sécurité privée",
    "Sécurité et surveillance privées",
    "Conduite d'opérations funéraires",
    "Conseil en services funéraires",
    "Thanatopraxie",
    "Animation musicale et scénique",
    "Mannequinat et pose artistique",
    "Présentation de spectacles ou d'émissions",
    "Art dramatique",
    "Arts du cirque et arts visuels",
    "Danse",
    "Musique et chant",
    "Mise en scène de spectacles vivants",
    "Production et administration spectacle, cinéma et audiovisuel",
    "Promotion d'artistes et de spectacles",
    "Réalisation cinématographique et audiovisuelle",
    "Sportif professionnel",
    "Coiffure et maquillage spectacle",
    "Costume et Habillage spectacle",
    "Décor et accessoires spectacle",
    "Éclairage spectacle",
    "Image cinématographique et télévisuelle",
    "Machinerie spectacle",
    "Montage et post-production",
    "Prise de son et sonorisation",
    "Régie générale",
    "Achats",
    "Direction des achats",
    "Analyse et ingénierie financière",
    "Audit et contrôle comptables et financiers",
    "Comptabilité",
    "Contrôle de gestion",
    "Direction administrative et financière",
    "Management de groupe ou de service comptable",
    "Trésorerie et financement",
    "Direction de grande entreprise ou d'établissement public",
    "Direction de petite ou moyenne entreprise",
    "Conduite d'enquêtes",
    "Conseil en organisation et management d'entreprise",
    "Études et prospectives socio-économiques",
    "Management et gestion d'enquêtes",
    "Assistanat en ressources humaines",
    "Développement des ressources humaines",
    "Management des ressources humaines",
    "Accueil et renseignements",
    "Assistanat de direction",
    "Assistanat technique et administratif",
    "Distribution de documents",
    "Opérations administratives",
    "Saisie de données",
    "Secrétariat",
    "Secrétariat comptable",
    "Secrétariat et assistanat médical ou médico-social",
    "Administration des ventes",
    "Analyse de tendance",
    "Management et gestion de produit",
    "Management relation clientèle",
    "Marketing",
    "Promotion des ventes",
    "Stratégie commerciale",
    "Administration de systèmes d'information",
    "Conseil et maîtrise d'ouvrage en systèmes d'information",
    "Direction des systèmes d'information",
    "Études et développement de réseaux de télécoms",
    "Études et développement informatique",
    "Expertise et support technique en systèmes d'information",
    "Exploitation de systèmes de communication et de commandement",
    "Information géographique",
    "Information météorologique",
    "Production et exploitation de systèmes d'information",
    "Conduite d'engins de déplacement des charges",
    "Déménagement",
    "Magasinage et préparation de commandes",
    "Manoeuvre et conduite d'engins lourds de manutention",
    "Manutention manuelle de charges",
    "Affrètement transport",
    "Gestion des opérations de circulation internationale des marchandises",
    "Conception et organisation de la chaîne logistique",
    "Direction de site logistique",
    "Intervention technique d'exploitation logistique",
    "Direction d'exploitation des transports routiers de marchandises",
    "Direction d'exploitation des transports routiers de personnes",
    "Intervention technique d'exploitation des transports routiers de marchandises",
    "Intervention technique d'exploitation des transports routiers de personnes",
    "Conduite de transport de marchandises sur longue distance",
    "Conduite de transport de particuliers",
    "Conduite de transport en commun sur route",
    "Conduite et livraison par tournées sur courte distance",
    "Courses et livraisons express",
    "Navigation commerciale aérienne",
    "Pilotage et navigation technique aérienne",
    "Encadrement de la navigation maritime",
    "Equipage de la navigation maritime",
    "Navigation fluviale",
    "Conduite sur rails",
    "Contrôle des transports en commun",
    "Contrôle de la navigation aérienne",
    "Direction d'escale et exploitation aéroportuaire",
    "Exploitation des pistes aéroportuaires",
    "Personnel d'escale aéroportuaire",
    "Préparation des vols",
    "Circulation du réseau ferré",
    "Exploitation et manoeuvre des remontées mécaniques",
    "Manoeuvre du réseau ferré",
    "Exploitation des opérations portuaires et du transport maritime",
    "Exploitation du transport fluvial",
    "Manutention portuaire"
  ].freeze

  STATUS = [
    'Sans activité',
    'Étudiant·e',
    'Étudiant·e (décrochage)',
    'Lycéen·ne – collégien·ne',
    'Lycéen·ne – collégien·ne (décrochage)',
    'Salarié·e'
  ].freeze

  CITIES = [
    "Ay",
    "Bar-sur-Aube",
    "Bogny-sur-Meuse",
    "Bétheny",
    "Charleville-Mézières",
    "Chaumont",
    "Châlons-en-Champagne",
    "Cormontreuil",
    "Épernay",
    "Fagnières",
    "Fismes",
    "Fumay",
    "Givet",
    "Joinville",
    "La Chapelle-Saint-Luc",
    "Langres",
    "Montmirail",
    "Mourmelon-le-Grand",
    "Nogent",
    "Nogent-sur-Seine",
    "Nouzonville",
    "Pont-Sainte-Marie",
    "Reims",
    "Rethel",
    "Revin",
    "Romilly-sur-Seine",
    "Saint-André-les-Vergers",
    "Saint-Dizier",
    "Saint-Julien-les-Villas",
    "Saint-Memmie",
    "Sainte-Menehould",
    "Sainte-Savine",
    "Sedan",
    "Sézanne",
    "Tinqueux",
    "Troyes",
    "Vitry-le-François",
    "Vouziers",
    "Vrigne-aux-Bois",
    "Witry-lès-Reims"
  ].freeze

  STEPS = %i(
    knowledge
    formation
    profile
    inscriptions
  ).freeze

  attr_accessor :current_step

  with_options if: -> { required_for_step?(:knowledge) } do |step|
    step.validates :knowledge, presence: true
  end

  with_options if: -> { required_for_step?(:profile) } do |step|
    step.validates :age, presence: true
    step.validates :status, presence: true
    step.validates :city, presence: true
  end

  private

  def required_for_step?(step)
    return true if step.nil?
    return true if STEPS.index(step.to_sym) <= STEPS.index(current_step)
  end
end
