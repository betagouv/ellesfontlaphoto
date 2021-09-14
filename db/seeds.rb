help_test = Help.new(
    title: "AIC",
    description: "Accompagner le financement d'un projet de création ou de recherche artistique.",
    sector: "Arts visuels",
    structure_name: "DRAC Grand-Est",
    start_month: "Janvier",
    end_month: "Février",
    help_amount: "8000 euros maximum",
    residence_condition: "Grand-Est",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Si vous avez déjà dénéficié de cette aide, attendez 4 ans avant une nouvelle candidature ; Il est interdit de candidater à l'AIC dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques.",
    candidate_url: "https://www.culture.gouv.fr/Regions/Drac-Grand-Est/aides/subventions/arts-visuels/AIC",
    selection: "Les demandes sont examinées par une commission réunie une fois par an. La commission émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    url_commission: "https://www.culture.gouv.fr/Media/Regions/Drac-Grand-Est/Files/Creation/Arts-plastiques/Arrete-du-prefet-de-region-Membres-de-la-commission-Aides-deconcentrees-Arts-plastiques-Grand-Est-2021-2023",
    help_type: "Production",
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    contact_institution: "<ul><li>Départements des Ardennes (08) Aube (10) Marne (51) Haute-Marne (52) de Meurthe-et-Moselle (54) et Meuse (55)
    Laurent Innocenzi, conseiller
    laurent.innocenzi@culture.gouv.fr</li>
    <li>Départements de Moselle (57) des Vosges (88) du Bas-Rhin (67) et du Haut-Rhin (68)
    Bernard Goy, conseiller
    bernard.goy@culture.gouv.fr</li></ul>
    ",
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Grand-Est/Creation/Arts-visuels",
  )

help_test.save
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?