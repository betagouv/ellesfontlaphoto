AdminUser.destroy_all
Help.destroy_all
3.times do
  help_test = Help.new(
      title: "AIC",
      description: "Accompagner le financement d'un projet de création ou de recherche artistique.",
      sector: "Arts visuels",
      structure_name: "DRAC Grand-Est",
      start_date: Date.new(2021,9,1),
      end_date: Date.new(2021,10,31),
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

  help_test_second = Help.new(
      title: "Secours exceptionnel",
      description: "Aide ponctuelle aux artistes rencontrant des difficultés momentanées. Ouverte, trois à quatre fois par an",
      sector: "Arts plastiques et visuels",
      structure_name: "CNAP",
      start_date: Date.new(2021,11,1),
      end_date: Date.new(2021,11,30),
      help_amount: "1 500 €",
      residence_condition: "France ou résidant en France",
      general_condition: "Interruption temporaire d’activité artistique ; Revenu fiscal de
  référence par part < 18 000 €",
      specific_condition: "Un refus empêche de candidater l’année suivante ; Cette aide
  ne peut être obtenue que tous les trois ans.",
      candidate_url: " https://www.cnap.fr/sites/default/files/Secours
  %20exceptionnel-Tutoriel%20des%20aides%20du%20Cnap.pdf",
      qa_url: "https://www.cnap.fr/soutien-la-creation/secours-
  exceptionnel/secours-exceptionnel/fa",
      selection: "Les demandes sont examinées par une commission, qui émet
  un avis au vu du professionnalisme de l’artiste, et des difficultés financières ou
  sociales rencontrées et de leur impact sur la carrière et les capacités de production.
  L’accompagnement par les services sociaux locaux est également pris en compte.",
      compo_commission: "Les membres (8 femmes) sont nommées par le CNAP pour 3 ans",
      url_commission: "https://www.cnap.fr/soutien-la-creation/artistes/secours-exceptionnel/
  membres-commission",
      statistic: "121 photographes lauréates et lauréats (dont 59 femmes et 62 hommes)
  sur 130 personnes candidates en 2021. Tous secteurs confondus, 806 artistes ont reçu
  ce soutien en 2021.",
      help_type: "Sociale",
      example_enrollment_url: "#",
      admin_attachment: "<ul>
      <li>CV</li>
      <li>pièce d’identité</li>
      <li>affiliation à la sécurité sociale
  des artistes-auteurs</li>
      <li>RIB</li>
      <li>avis SIRENE</li>
      <li>titre de séjour</li>
      <li>dernier avis d’imposition</li>
      </ul>",
      artistic_attachment: "<ul><li>portfolio (10 visuels minimum)</li></ul>",
      contact_email: "estelle.moy@cnap.fr",
      contact_institution: "Estelle Moy, chargée des soutiens aux artistes au CNAP
      ",
      contact_institution_url: "https://www.cnap.fr/navigation/soutien-la-creation/secours-exceptionnel/modalites-de-
  candidature",
      issue_contact: "#"
    )

  help_test_second.save

  help_test_third = Help.new(
      title: "AIA",
      description: "Aide ponctuelle aux artistes rencontrant des difficultés momentanées. Ouverte, trois à quatre fois par an",
      sector: "Arts plastiques et visuels",
      structure_name: "CNAP",
      start_date: Date.new(2021,10,1),
      end_date: Date.new(2021,10,30),
      help_amount: "1 500 €",
      residence_condition: "France ou résidant en France",
      general_condition: "Interruption temporaire d’activité artistique ; Revenu fiscal de
  référence par part < 18 000 €",
      specific_condition: "Un refus empêche de candidater l’année suivante ; Cette aide
  ne peut être obtenue que tous les trois ans.",
      candidate_url: " https://www.cnap.fr/sites/default/files/Secours
  %20exceptionnel-Tutoriel%20des%20aides%20du%20Cnap.pdf",
      qa_url: "https://www.cnap.fr/soutien-la-creation/secours-
  exceptionnel/secours-exceptionnel/fa",
      selection: "Les demandes sont examinées par une commission, qui émet
  un avis au vu du professionnalisme de l’artiste, et des difficultés financières ou
  sociales rencontrées et de leur impact sur la carrière et les capacités de production.
  L’accompagnement par les services sociaux locaux est également pris en compte.",
      compo_commission: "Les membres (8 femmes) sont nommées par le CNAP pour 3 ans",
      url_commission: "https://www.cnap.fr/soutien-la-creation/artistes/secours-exceptionnel/
  membres-commission",
      statistic: "121 photographes lauréates et lauréats (dont 59 femmes et 62 hommes)
  sur 130 personnes candidates en 2021. Tous secteurs confondus, 806 artistes ont reçu
  ce soutien en 2021.",
      help_type: "Sociale",
      example_enrollment_url: "#",
      admin_attachment: "<ul>
      <li>CV</li>
      <li>pièce d’identité</li>
      <li>affiliation à la sécurité sociale
  des artistes-auteurs</li>
      <li>RIB</li>
      <li>avis SIRENE</li>
      <li>titre de séjour</li>
      <li>dernier avis d’imposition</li>
      </ul>",
      artistic_attachment: "<ul><li>portfolio (10 visuels minimum)</li></ul>",
      contact_email: "estelle.moy@cnap.fr",
      contact_institution: "Estelle Moy, chargée des soutiens aux artistes au CNAP
      ",
      contact_institution_url: "https://www.cnap.fr/navigation/soutien-la-creation/secours-exceptionnel/modalites-de-
  candidature",
      issue_contact: "#"
    )

  help_test_third.save

end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
