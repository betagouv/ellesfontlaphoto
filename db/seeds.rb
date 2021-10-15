p "Destroy elements"
AdminUser.destroy_all
Help.destroy_all
ConseilsVideo.destroy_all
ConseilsArticle.destroy_all

p "Create helps"

conseils_videos = ConseilsVideo.new(
  title: "La place dans la profession",
  subtitle: "La place dans la profession son soustitre",
  category: ["Administratif"],
  tags:["Commencer mon activité", "Sensibiliser pour l'égalité"],
  format: "Thematique",
  objectif: "Aider a comprendre la situation grace a cette video",
  lecture_time: 2,
  contenu_explication: "Lorem ipsum dolor sit amet. Id accusamus omnis ut veniam perferendis et impedit ratione! Nihil asperiores sed consequuntur nemo non sint ducimus ut dolorem omnis sit consequuntur voluptatem eos exercitationem molestiae ut velit distinctio.

  Sit voluptatum maiores eos earum tempore est nemo illum est asperiores totam sit perspiciatis nihil rem mollitia quos ut natus voluptas. Est rerum modi 33 facilis consequatur ut perspiciatis delectus ut unde ipsa quo sunt rerum ut nemo neque vel rerum itaque. Et officia sunt aut rerum sunt nam rerum quia quidem eligendi aut quae voluptas.

  Quo praesentium magnam rem nisi exercitationem aut atque accusamus. Ab fugiat sunt sit sunt quas et fugiat cum aliquid corporis.",
  liens_utiles:["www.google.fr","www.facebook.com"],
  protagoniste: "Marie Docher"
  )
conseils_videos.save
  sleep(2)

conseils_articles = ConseilsArticle.new(
  title: "Comprendre les critères d'attribution d'une aide publique",
  subtitle: "Comprendre les critères d'attribution d'une aide publique son soustitre",
  category: ["Matrimoine"],
  tags: ["Me former"],
  objectif: "Adapter sa candidate aux attentes des services publics",
  lecture_time: 2,
  introduction: "Lorem ipsum dolor sit amet. Id accusamus omnis ut veniam perferendis et impedit ratione! Nihil asperiores sed consequuntur nemo non sint ducimus ut dolorem omnis sit consequuntur voluptatem eos exercitationem molestiae ut velit distinctio.",
  explication: "Sit voluptatum maiores eos earum tempore est nemo illum est asperiores totam sit perspiciatis nihil rem mollitia quos ut natus voluptas. Est rerum modi 33 facilis consequatur ut perspiciatis delectus ut unde ipsa quo sunt rerum ut nemo neque vel rerum itaque. Et officia sunt aut rerum sunt nam rerum quia quidem eligendi aut quae voluptas.",
  perspective: "Sit voluptatum maiores eos earum tempore est nemo illum est asperiores totam sit perspiciatis nihil rem mollitia quos ut natus voluptas. Est rerum modi 33 facilis consequatur ut perspiciatis delectus ut unde ipsa quo sunt rerum ut nemo neque vel rerum itaque. Et officia sunt aut rerum sunt nam rerum quia quidem eligendi aut quae voluptas.,
  Quo praesentium magnam rem nisi exercitationem aut atque accusamus. Ab fugiat sunt sit sunt quas et fugiat cum aliquid corporis.",
  citation: "Lorem ipsum dolor sit amet. Id accusamus omnis ut veniam perferendis et impedit ratione! Nihil asperiores sed consequuntur nemo non sint ducimus ut dolorem omnis sit consequuntur voluptatem eos exercitationem molestiae ut velit distinctio.",
  a_retenir: "Quo praesentium magnam rem nisi exercitationem aut atque accusamus. Ab fugiat sunt sit sunt quas et fugiat cum aliquid corporis.",
  liens_utiles:["www.google.fr","www.facebook.com"],
  auteur: "Laurie Chapotte",
  sources: ["Laurie Chapotte","Google.fr"]
  )
conseils_articles.save
sleep(2)
conseils_videos1 = ConseilsVideo.new(
  title: "La place dans la profession",
  subtitle: "La place dans la profession son soustitre",
  category: ["Financier"],
  tags:["Commencer mon activité", "Sensibiliser pour l'égalité", "Me former"],
  format: "Thematique",
  objectif: "Aider a comprendre la situation grace a cette video",
  lecture_time: 2,
  contenu_explication: "Lorem ipsum dolor sit amet. Id accusamus omnis ut veniam perferendis et impedit ratione! Nihil asperiores sed consequuntur nemo non sint ducimus ut dolorem omnis sit consequuntur voluptatem eos exercitationem molestiae ut velit distinctio.

  Sit voluptatum maiores eos earum tempore est nemo illum est asperiores totam sit perspiciatis nihil rem mollitia quos ut natus voluptas. Est rerum modi 33 facilis consequatur ut perspiciatis delectus ut unde ipsa quo sunt rerum ut nemo neque vel rerum itaque. Et officia sunt aut rerum sunt nam rerum quia quidem eligendi aut quae voluptas.

  Quo praesentium magnam rem nisi exercitationem aut atque accusamus. Ab fugiat sunt sit sunt quas et fugiat cum aliquid corporis.",
  liens_utiles:["www.google.fr","www.facebook.com"],
  protagoniste: "Marie Docher"
  )
conseils_videos1.save
sleep(2)
conseils_articles1 = ConseilsArticle.new(
  title: "Comprendre les critères d'attribution d'une aide publique",
  subtitle: "Comprendre les critères d'attribution d'une aide publique son soustitre",
  category: ["Financier"],
  tags: ["Me former", "Commencer mon activité"],
  objectif: "Adapter sa candidate aux attentes des services publics",
  lecture_time: 2,
  introduction: "Lorem ipsum dolor sit amet. Id accusamus omnis ut veniam perferendis et impedit ratione! Nihil asperiores sed consequuntur nemo non sint ducimus ut dolorem omnis sit consequuntur voluptatem eos exercitationem molestiae ut velit distinctio.",
  explication: "Sit voluptatum maiores eos earum tempore est nemo illum est asperiores totam sit perspiciatis nihil rem mollitia quos ut natus voluptas. Est rerum modi 33 facilis consequatur ut perspiciatis delectus ut unde ipsa quo sunt rerum ut nemo neque vel rerum itaque. Et officia sunt aut rerum sunt nam rerum quia quidem eligendi aut quae voluptas.",
  perspective: "Sit voluptatum maiores eos earum tempore est nemo illum est asperiores totam sit perspiciatis nihil rem mollitia quos ut natus voluptas. Est rerum modi 33 facilis consequatur ut perspiciatis delectus ut unde ipsa quo sunt rerum ut nemo neque vel rerum itaque. Et officia sunt aut rerum sunt nam rerum quia quidem eligendi aut quae voluptas.,
  Quo praesentium magnam rem nisi exercitationem aut atque accusamus. Ab fugiat sunt sit sunt quas et fugiat cum aliquid corporis.",
  citation: "Lorem ipsum dolor sit amet. Id accusamus omnis ut veniam perferendis et impedit ratione! Nihil asperiores sed consequuntur nemo non sint ducimus ut dolorem omnis sit consequuntur voluptatem eos exercitationem molestiae ut velit distinctio.",
  a_retenir: "Quo praesentium magnam rem nisi exercitationem aut atque accusamus. Ab fugiat sunt sit sunt quas et fugiat cum aliquid corporis.",
  liens_utiles:["www.google.fr","www.facebook.com"],
  auteur: "Laurie Chapotte",
  sources: ["Laurie Chapotte","Google.fr"]
  )
conseils_articles1.save

help1 = Help.new(
    identifiant: "AICGE",
    institution_name: "DRAC Grand-Est",
    title: "Aide à la création artistique (AIC)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour soutenir le développement d'un projet de création ou de recherche artistique. ",
    description_url: "https://www.culture.gouv.fr/Regions/Drac-Grand-Est/aides/subventions/arts-visuels/AIC",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 8 000 €",
    residence_condition: "Grand-Est",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Une aide publique ne peut financer la totalité du budget d'un projet ; Cette aide ne peut être obtenue que tous les 4 ans ; Il est interdit de candidater à cette aide dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://www.culture.gouv.fr/Regions/Drac-Grand-Est/aides/subventions/arts-visuels/AIC",
    selection: "Les demandes sont examinées par une commission réunie une fois par an. La commission émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    url_commission: "https://www.culture.gouv.fr/Media/Regions/Drac-Grand-Est/Files/Creation/Arts-plastiques/Arrete-du-prefet-de-region-Membres-de-la-commission-Aides-deconcentrees-Arts-plastiques-Grand-Est-2021-2023",
    help_type: ["Production"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    contact_institution: "Conseillers pour les arts plastiques et visuels : <ul><li> Laurent Innocenzi, référent sur les départements 08, 10, 51, 52, 54, et 55</li>
    <li>Bernard Goy, référent sur les départements 57, 88, 67 et 68.</li></ul>
    ",
    contact_intitution_email: ["laurent.innocenzi@culture.gouv.fr", "bernard.goy@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Grand-Est/Creation/Arts-visuels"
  )

help1.save

help2 = Help.new(
    identifiant: "AICNA",
    institution_name: "DRAC Nouvelle-Aquitaine",
    title: "Aide à la création artistique (AIC)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour soutenir le développement d'un projet de création ou de recherche artistique. ",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 8 000 €",
    residence_condition: "Nouvelle-Aquitaine",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Une aide publique ne peut financer la totalité du budget d'un projet ; Cette aide ne peut être obtenue que tous les 4 ans ; Il est interdit de candidater à cette aide dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    selection: "Les demandes sont examinées par une commission réunie une fois par an. La commission émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    help_type: ["Production"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    contact_institution: "Conseillers pour les arts plastiques et visuels :<ul><li>Bertrand FLEURY, référent sur les départements 17, 33, 40, 47, 64, 79</li>
    <li>Mathieu BORDES, référent sur les départements 16, 19, 23, 24, 86, 87</li></ul>
    ",
    contact_intitution_email: ["bertrand.fleury@culture.gouv.fr", "mathieu.bordes@culture.gouv.fr "],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/DRAC-Nouvelle-Aquitaine/Creation-Industries-culturelles/Arts-plastiques",
  )

help2.save

help3 = Help.new(
    identifiant: "AICRA",
    institution_name: "DRAC Auvergne-Rhône Alpes",
    title: "Aide à la création artistique (AIC)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour soutenir le développement d'un projet de création ou de recherche artistique. ",
    description_url: "https://www.culture.gouv.fr/Regions/Drac-Auvergne-Rhone-Alpes/Demarches-aides/Aides-financieres/Aides-arts-plastiques",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 8 000 €",
    residence_condition: "Auvergne-Rhône Alpes",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Une aide publique ne peut financer la totalité du budget d'un projet ; Cette aide ne peut être obtenue que tous les 4 ans ; Il est interdit de candidater à cette aide dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://mesdemarches.culture.gouv.fr/mcc/requests/ARTSP_AIDES_creation_02/",
    selection: "Les demandes sont examinées par une commission réunie une fois par an. La commission émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    help_type: ["Production"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    contact_institution: "Conseillères pour les arts plastiques et visuels :<ul><li>Hélène Rongier, référente sur les départements 03, 07, 15, 42, 43 et 63</li>
    <li>Pascale Morestin, référente sur les départements 01, 26, 38, 69, 73 et 74.</li></ul>
    ",
    contact_intitution_email: [" helene.bertin-rongier@culture.gouv.fr", "pascale.morestin@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Auvergne-Rhone-Alpes/Demarches-aides/Aides-financieres/Aides-arts-plastiques ",
  )

help3.save

help4 = Help.new(
    identifiant: "AICBFC",
    institution_name: "DRAC Bourgogne-Franche-Comté",
    title: "Aide à la création artistique (AIC)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour soutenir le développement d'un projet de création ou de recherche artistique. ",
    description_url: "https://www.culture.gouv.fr/Aides-demarches/Appels-a-projets/Candidatures-AIA-AIC",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 8 000 €",
    residence_condition: "Bourgogne-Franche-Comté",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Une aide publique ne peut financer la totalité du budget d'un projet ; Cette aide ne peut être obtenue que tous les 4 ans ; Il est interdit de candidater à cette aide dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://mesdemarches.culture.gouv.fr/mcc/requests/ARTSP_AIDES_creation_02/",
    selection: "Les demandes sont examinées par une commission réunie une fois par an. La commission émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    url_commission: "https://www.culture.gouv.fr/Media/Medias-creation-rapide/arrete_membres_commission_AP.pdf",
    old_laureat: "Une dizaine d'aides attribuées en 2020 en Bourgogne Franche Comté, de façon paritaire.",
    old_laureat_url: "https://www.culture.gouv.fr/Media/Medias-creation-rapide/AIC_AIA_LISTE_ARTISTES_AIDES_ANNEES_ANTERIEURES.pdf2",
    help_type: ["Production"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    contact_institution: "Conseiller et conseillère pour les arts plastiques et visuels :<ul><li>Rémy Fenzy, référent sur le site de Dijon</li><li>Corinne Gambi, référente sur le site de Besançon.</li></ul>
    ",
    contact_intitution_email: [" remy.fenzy@culture.gouv.fr", "corinne.gambi@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Bourgogne-Franche-Comte/Votre-DRAC/Creation-Industries-et-Actions-Culturelles/Arts-Plastiques",
  )

help4.save

help5 = Help.new(
    identifiant: "AICB",
    institution_name: "DRAC Bretagne",
    title: "Aide à la création artistique (AIC)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour soutenir le développement d'un projet de création ou de recherche artistique. ",
    description_url: "https://www.culture.gouv.fr/Regions/Drac-Bretagne/Aides-et-demarches/Arts-visuels-cinema-livre-et-lecture-spectacle-vivant/Arts-visuels",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 8 000 €",
    residence_condition: "Bretagne",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Une aide publique ne peut financer la totalité du budget d'un projet ; Cette aide ne peut être obtenue que tous les 4 ans ; Il est interdit de candidater à cette aide dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://mesdemarches.culture.gouv.fr/mcc/requests/ARTSP_AIDES_creation_02/",
    selection: "Les demandes sont examinées par une commission réunie une fois par an. La commission émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    url_commission: "https://www.culture.gouv.fr/Media/Medias-creation-rapide/2020_05_19_arrete_renouvellement_AIC_AIA.pdf",
    old_laureat: "Une quinzaine d’aides attribuées par an en Bretagne, de façon quasiment paritaire, pour une moyenne de 3000 euros en 2021.",
    old_laureat_url: "https://www.culture.gouv.fr/Regions/Drac-Bretagne/Politique-et-actions-culturelles/Arts-visuels",
    help_type: ["Production"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    contact_institution: "Conseiller pour les arts visuels : Olivier Lerch. N'hésitez pas à solliciter un rendez-vous pour être accompagnée dans la constitution de votre dossier.",
    contact_intitution_email: [" cap.bretagne@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Bretagne/Aides-et-demarches/Arts-visuels-cinema-livre-et-lecture-spectacle-vivant/Arts-visuels ",
  )

help5.save

help6 = Help.new(
    identifiant: "AICCVL",
    institution_name: "DRAC Centre-Val de Loire",
    title: "Aide à la création artistique (AIC)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour soutenir le développement d'un projet de création ou de recherche artistique. ",
    description_url: "https://www.culture.gouv.fr/Regions/Drac-Centre-Val-de-Loire/Vos-demarches/Subventions/Arts-plastiques-Photographie-Multimedia/AIDE-INDIVIDUELLE-A-LA-CREATION",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 8 000 €",
    residence_condition: "Centre-Val de Loire",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Une aide publique ne peut financer la totalité du budget d'un projet ; Cette aide ne peut être obtenue que tous les 4 ans ; Il est interdit de candidater à cette aide dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://mesdemarches.culture.gouv.fr/mcc/requests/ARTSP_AIDES_creation_02/",
    selection: "Les demandes sont examinées par une commission réunie une fois par an. La commission émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    url_commission: "https://www.prefectures-regions.gouv.fr/centre-val-de-loire/content/download/57885/380715/file/%20recueil-r24-2019-134%20du%2002%20mai%202019.pdf",
    help_type: ["Production"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    contact_institution: "Conseiller pour les arts visuels : Jean-Christophe Royoux",
    contact_intitution_email: [" artsplastiques.centre@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Centre-Val-de-Loire/Vos-demarches/Subventions/Arts-plastiques-Photographie-Multimedia",
  )

help6.save

help7 = Help.new(
    identifiant: "AICC",
    institution_name: "DRAC Corse",
    title: "Aide à la création artistique (AIC)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour soutenir le développement d'un projet de création ou de recherche artistique. ",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 8 000 €",
    residence_condition: "Corse",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Une aide publique ne peut financer la totalité du budget d'un projet ; Cette aide ne peut être obtenue que tous les 4 ans ; Il est interdit de candidater à cette aide dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    selection: "Les demandes sont examinées par une commission réunie une fois par an. La commission émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    help_type: ["Production"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Corse/DRAC",
  )

help7.save

help8 = Help.new(
    identifiant: "AICIDF",
    institution_name: "DRAC Ile-de-France",
    title: "Aide à la création artistique (AIC)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour soutenir le développement d'un projet de création ou de recherche artistique. ",
    description_url: "https://www.culture.gouv.fr/Regions/Drac-Ile-de-France/Aides-et-demarches/Departements-des-arts-visuels",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 8 000 €",
    residence_condition: "Ile-de-France",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Une aide publique ne peut financer la totalité du budget d'un projet ; Cette aide ne peut être obtenue que tous les 4 ans ; Il est interdit de candidater à cette aide dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "http://mesdemarches.culture.gouv.fr/mcc/requests/ARTSP_AIDES_creation_02/%20",
    selection: "Les demandes sont examinées par une commission réunie une fois par an. La commission émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    old_laureat: "37 aides attribuées en 2020 en Ile-de-France, de façon paritaire, dont 4 projets photographiques.",
    old_laureat_url: "https://www.culture.gouv.fr/Regions/Drac-Ile-de-France/Arts-visuels/Laureats-de-l-Aide-individuelle-a-la-creation-session-2020",
    help_type: ["Production"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    contact_institution: "Conseillère pour les arts visuels : Isabelle Boulord",
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Ile-de-France/Aides-et-demarches/Departements-des-arts-visuels ",
  )

help8.save

help9 = Help.new(
    identifiant: "AICO",
    institution_name: "DRAC Occitanie",
    title: "Aide à la création artistique (AIC)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour soutenir le développement d'un projet de création ou de recherche artistique. ",
    description_url: "https://www.culture.gouv.fr/Regions/Drac-Occitanie/Aides-et-demarches/Aides-et-subventions/Aides-Arts-plastiques",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 8 000 €",
    residence_condition: "Occitanie",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Une aide publique ne peut financer la totalité du budget d'un projet ; Cette aide ne peut être obtenue que tous les 4 ans ; Il est interdit de candidater à cette aide dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://mesdemarches.culture.gouv.fr/mcc/requests/ARTSP_AIDES_creation_02/",
    selection: "Les demandes sont examinées par une commission réunie une fois par an. La commission émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    help_type: ["Production"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    contact_institution: "Conseillères pour les arts plastiques et visuels :<ul><li>Catherine Dumon, référente sur le site de Montpellier</li><li>Marie-Béatrice Angelé, référente sur le site de Toulouse</li></ul>  N'hésitez pas à solliciter un rendez-vous pour être accompagnée dans la constitution de votre dossier.",
    contact_intitution_email: [" catherine.dumon@culture.gouv.fr", "artsplastiques.occitanie@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Occitanie/Aides-et-demarches/Aides-et-subventions/Aides-Arts-plastiques",
  )

help9.save

help10 = Help.new(
    identifiant: "AICN",
    institution_name: "DRAC Normandie",
    title: "Aide à la création artistique (AIC)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour soutenir le développement d'un projet de création ou de recherche artistique. ",
    description_url: "https://www.culture.gouv.fr/Regions/Drac-Normandie/Aides-et-demarches/Aides-et-demarches-pour-la-creation-artistique-et-le-developpement-des-publics/Aides-concernant-le-secteur-des-arts-plastiques",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 8 000 €",
    residence_condition: "Normandie",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Une aide publique ne peut financer la totalité du budget d'un projet ; Cette aide ne peut être obtenue que tous les 4 ans ; Il est interdit de candidater à cette aide dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://mesdemarches.culture.gouv.fr/mcc/requests/ARTSP_AIDES_creation_02/",
    selection: "Les demandes sont examinées par une commission réunie une fois par an. La commission émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    url_commission: "https://www.culture.gouv.fr/Regions/Drac-Normandie/Aides-et-demarches/Aides-et-demarches-pour-la-creation-artistique-et-le-developpement-des-publics/Aides-concernant-le-secteur-des-arts-plastiques",
    help_type: ["Production"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    contact_institution: "Conseiller pour les arts plastiques : Jérôme Felin. N'hésitez pas à solliciter un rendez-vous pour être accompagnée dans la constitution de votre dossier.",
    contact_intitution_email: [" catherine.dumon@culture.gouv.fr", "artsplastiques.occitanie@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Occitanie/Aides-et-demarches/Aides-et-subventions/Aides-Arts-plastiques",
  )

help10.save

help11 = Help.new(
    identifiant: "AICHF",
    institution_name: "DRAC Hauts de France",
    title: "Aide à la création artistique (AIC)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour soutenir le développement d'un projet de création ou de recherche artistique. ",
    description_url: "https://www.culture.gouv.fr/Regions/Drac-Hauts-de-France/Politique-et-actions-des-services/Pole-creation/Arts-visuels/Aides-destinees-aux-artistes-auteurs-arts-visuels",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 8 000 €",
    residence_condition: "Hauts de France",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Une aide publique ne peut financer la totalité du budget d'un projet ; Cette aide ne peut être obtenue que tous les 4 ans ; Il est interdit de candidater à cette aide dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://mesdemarches.culture.gouv.fr/mcc/requests/ARTSP_AIDES_creation_02/",
    selection: "Les demandes sont examinées par une commission réunie une fois par an. La commission émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    help_type: ["Production"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    contact_institution: "Conseiller et conseillère pour les arts plastiques et visuels :<ul><li>Françoise Dubois, référente dans les départements 02, 60, 80</li><li>Eric Jarrot, référent pour les départements 59 et 62.</li></ul>",
    contact_intitution_email: [" francoise.dubois@culture.gouv.fr", "eric.jarrot@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Hauts-de-France/Politique-et-actions-des-services/Pole-creation/Arts-visuels",
  )

help11.save

help12 = Help.new(
    identifiant: "AICPDL",
    institution_name: "DRAC Pays de la Loire",
    title: "Aide à la création artistique (AIC)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour soutenir le développement d'un projet de création ou de recherche artistique. ",
    description_url: "https://www.culture.gouv.fr/Regions/Drac-Pays-de-la-Loire/Vos-demarches-et-documentations/Arts-plastiques-et-metiers-d-art",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 8 000 €",
    residence_condition: "Pays de la Loire",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Une aide publique ne peut financer la totalité du budget d'un projet ; Cette aide ne peut être obtenue que tous les 4 ans ; Il est interdit de candidater à cette aide dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://mesdemarches.culture.gouv.fr/mcc/requests/ARTSP_AIDES_creation_02/",
    selection: "Les demandes sont examinées par une commission réunie une fois par an. La commission émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    old_laureat: "8 aides attribuées en 2017 en Pays de la Loire, dont deux attribuées à des femmes.",
    old_laureat_url: "https://www.culture.gouv.fr/Regions/Drac-Pays-de-la-Loire/Politique-et-actions/Arts-visuels/Developper-la-creation",
    help_type: ["Production"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    contact_intitution_email: ["arts-plastiques.paysdelaloire@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Pays-de-la-Loire/Vos-demarches-et-documentations/Arts-plastiques-et-metiers-d-art",
  )

help12.save

help13 = Help.new(
    identifiant: "AICPACA",
    institution_name: "DRAC Provence-Alpes-Côte-d'Azur",
    title: "Aide à la création artistique (AIC)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour soutenir le développement d'un projet de création ou de recherche artistique. ",
    description_url: "https://www.culture.gouv.fr/Regions/Drac-Provence-Alpes-Cote-d-Azur/Aides-demarches/Aides-financieres/Aides-aux-artistes-plasticiens",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 8 000 €",
    residence_condition: "Provence-Alpes-Côte-d'Azur",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Une aide publique ne peut financer la totalité du budget d'un projet ; Cette aide ne peut être obtenue que tous les 4 ans ; Il est interdit de candidater à cette aide dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://www.demarches-simplifiees.fr/commencer/aide-individuelle-creation",
    selection: "Les demandes sont examinées par une commission réunie une fois par an. La commission émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est composée de 7 femmes et 2 hommes (mais les membres peuvent être représentés).  ",
    url_commission: "https://www.culture.gouv.fr/Media/Regions/Drac-Paca/Files/Aides-demarches/Aides-financieres/Arts-plastiques/Commission-consultative-d-aides-a-la-creation-et-des-allocations-d-installation-d-atelier-2020-2022",
    old_laureat: "Une trentaine d'aides attribuées en 2020 en Provence-Alpes-Côte-d'Azur, de façon paritaire.",
    old_laureat_url: "https://www.culture.gouv.fr/Regions/Drac-Provence-Alpes-Cote-d-Azur/Aides-demarches/Aides-financieres/Aides-aux-artistes-plasticiens",
    help_type: ["Production"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    contact_institution: "Conseillère pour les arts visuels : Aurélie Hence",
    contact_intitution_email: ["aurelie.hance@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Provence-Alpes-Cote-d-Azur",
  )

help13.save

help14 = Help.new(
    identifiant: "AICG",
    institution_name: "DAC Guadeloupe",
    title: "Aide à la création artistique (AIC)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour soutenir le développement d'un projet de création ou de recherche artistique. ",
    description_url: "https://www.culture.gouv.fr/Media/Medias-creation-rapide/aide-a-la-creation-2020.doc",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 8 000 €",
    residence_condition: "Guadeloupe",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Une aide publique ne peut financer la totalité du budget d'un projet ; Cette aide ne peut être obtenue que tous les 4 ans ; Il est interdit de candidater à cette aide dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://www.culture.gouv.fr/Media/Medias-creation-rapide/aide-a-la-creation-2020.doc",
    selection: "Un premier dossier comprenant au moins une note d’intention artistique, un CV et un budget prévisionnel doit être envoyé avant le 20 décembre 2021. Les demandes seront ensuite examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    help_type: ["Production"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    contact_institution: "Conseillère pour les arts visuels : Valérie Labayle",
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Dac-Guadeloupe/Disciplines-et-secteurs/Arts-plastiques",
  )

help14.save

help15 = Help.new(
    identifiant: "AICGY",
    institution_name: "DAC Guyane",
    title: "Aide à la création artistique (AIC)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour soutenir le développement d'un projet de création ou de recherche artistique. ",
    description_url: "https://www.culture.gouv.fr/Regions/Dac-Guyane/Aides-et-demarches/Arts-plastiques",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,07,15),
    help_amount: "Jusqu'à 8 000 €",
    residence_condition: "Guyane",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Une aide publique ne peut financer la totalité du budget d'un projet ; Cette aide ne peut être obtenue que tous les 4 ans ; Il est interdit de candidater à cette aide dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://www.culture.gouv.fr/Regions/Dac-Guyane/Aides-et-demarches/Arts-plastiques",
    selection: "Les demandes sont examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    old_laureat: "4 aides attribuées en 2021 en Guyane, dont 3 attribuées à des femmes, sur 6 candidatures.",
    help_type: ["Production"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    contact_institution: "Conseillère pour les arts visuels : Sandrine Moreau",
    contact_intitution_email: ["sandrine.moreau@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Dac-Guyane/Aides-et-demarches/Arts-plastiques",
  )

help15.save

help16 = Help.new(
    identifiant: "AICM",
    institution_name: "DAC Martinique",
    title: "Aide à la création artistique (AIC)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour soutenir le développement d'un projet de création ou de recherche artistique. ",
    description_url: "https://www.culture.gouv.fr/Regions/DAC-Martinique/Disciplines-et-secteurs/Arts-plastiques",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,03,31),
    help_amount: "Jusqu'à 8 000 €",
    residence_condition: "Martinique",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Une aide publique ne peut financer la totalité du budget d'un projet ; Cette aide ne peut être obtenue que tous les 4 ans ; Il est interdit de candidater à cette aide dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    selection: "Les demandes sont examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    old_laureat: "4 aides attribuées en 2018 en Martinique, dont deux attribuées à des femmes.",
    old_laureat_url: "https://www.culture.gouv.fr/Regions/DAC-Martinique/Disciplines-et-secteurs/Arts-plastiques",
    help_type: ["Production"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    contact_institution: "Conseiller pour les arts plastiques et visuels : Anthoni Dominguez",
    contact_intitution_email: ["sandrine.moreau@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/DAC-Martinique/Disciplines-et-secteurs/Arts-plastiques",
  )

help16.save

help17 = Help.new(
    identifiant: "AICMY",
    institution_name: "DAC Mayotte",
    title: "Aide à la création artistique (AIC)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour soutenir le développement d'un projet de création ou de recherche artistique. ",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,05,31),
    help_amount: "Jusqu'à 8 000 €",
    residence_condition: "Mayotte",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Une aide publique ne peut financer la totalité du budget d'un projet ; Cette aide ne peut être obtenue que tous les 4 ans ; Il est interdit de candidater à cette aide dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    selection: "Les demandes sont examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget. ",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    help_type: ["Production"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    contact_institution: "Conseillère pour la création artistique : Gaëlle Metelus",
    contact_intitution_email: ["gaelle.metelus@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Dac-Mayotte/Action-culturelle-et-artistique/La-creation/Les-Aides-a-la-creation",
  )

help17.save

help18 = Help.new(
    identifiant: "AICR",
    institution_name: "DAC Réunion",
    title: "Aide à la création artistique (AIC)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour soutenir le développement d'un projet de création ou de recherche artistique. ",
    description_url: "https://www.culture.gouv.fr/Regions/Dac-de-La-Reunion/A-la-une/Aide-a-la-creation-individuelle-allocations-d-installation-d-atelier-et-achat-de-materiel-2021",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 8 000 €",
    residence_condition: "Réunion",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Une aide publique ne peut financer la totalité du budget d'un projet ; Cette aide ne peut être obtenue que tous les 4 ans ; Il est interdit de candidater à cette aide dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://mesdemarches.culture.gouv.fr/mcc/requests/ARTSP_AIDES_creation_02/",
    selection: "Les demandes sont examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget. ",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    help_type: ["Production"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    contact_institution: "Conseillère pour les arts plastiques et visuels : Natacha Provensal",
    contact_intitution_email: ["natacha.provensal@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Dac-de-La-Reunion/A-la-une/Aide-a-la-creation-individuelle-allocations-d-installation-d-atelier-et-achat-de-materiel-2021",
  )

help18.save

# AIA
help19 = Help.new(
    identifiant: "AIAARA",
    institution_name: "DRAC Auvergne-Rhône Alpes",
    title: "Aide à l'installation d'atelier et à l'achat de matériel (AIA)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour accompagner l’aménagement d’un local de travail ou l’acquisition de matériel non consommable.",
    description_url: "https://www.culture.gouv.fr/Regions/Drac-Auvergne-Rhone-Alpes/Demarches-aides/Aides-financieres/Aides-arts-plastiques",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 50 % du budget",
    residence_condition: "Auvergne-Rhône Alpes",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Cette aide ne peut être allouée que tous les 4 ans ; Il est interdit de candidater à l'AIA dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://mesdemarches.culture.gouv.fr/mcc/requests/ARTSP_AIDES_allocation_02/",
    selection: "Les demandes sont examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    help_type: ["Matériel"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    other_attachment: "<ul><li>attestation du ou de la propriétaire autorisant les travaux</li> <li>devis pour l’aménagement ou l’achat de matériel</li> <li> plans avant et après l’aménagement le cas échéant.</li></ul>",
    contact_institution: "<ul><li>Conseillères pour les arts plastiques : Hélène Rongier, référente sur les départements 03, 07, 15, 42, 43 et 63</li><li>Pascale Morestin, référente sur les départements 01, 26, 38, 69, 73 et 74</li></ul>",
    contact_intitution_email: [" helene.bertin-rongier@culture.gouv.fr","pascale.morestin@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Auvergne-Rhone-Alpes/Demarches-aides/Aides-financieres/Aides-arts-plastiques",
  )

help19.save

help20 = Help.new(
    identifiant: "AIAB",
    institution_name: "DRAC Bretagne",
    title: "Aide à l'installation d'atelier et à l'achat de matériel (AIA)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour accompagner l’aménagement d’un local de travail ou l’acquisition de matériel non consommable.",
    description_url: "https://www.culture.gouv.fr/Regions/Drac-Bretagne/Aides-et-demarches/Arts-visuels-cinema-livre-et-lecture-spectacle-vivant/Arts-visuels",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 50 % du budget",
    residence_condition: "Bretagne",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Cette aide ne peut être allouée que tous les 4 ans ; Il est interdit de candidater à l'AIA dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://mesdemarches.culture.gouv.fr/mcc/requests/ARTSP_AIDES_allocation_02/",
    selection: "Les demandes sont examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    url_commission: "https://www.culture.gouv.fr/Media/Medias-creation-rapide/2020_05_19_arrete_renouvellement_AIC_AIA.pdf",
    old_laureat: "Une vingtaine d’aides attribuées par an en Bretagne, de façon quasiment paritaire, pour une moyenne de 2500 euros en 2021. La plupart permettent de financer l’achat de matériel informatique ou de construction, ou les travaux d’installation d’un atelier ; environ 2 par an concernent spécifiquement du matériel photographique. Les descriptions des projets lauréats de l’année précédente peuvent être consultées en ligne.",
    old_laureat_url: "https://www.culture.gouv.fr/Regions/Drac-Bretagne/Politique-et-actions-culturelles/Arts-visuels",
    help_type: ["Matériel"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    other_attachment: "<ul><li>attestation du ou de la propriétaire autorisant les travaux</li> <li>devis pour l’aménagement ou l’achat de matériel</li> <li> plans avant et après l’aménagement le cas échéant.</li></ul>",
    contact_institution: "Conseiller pour les arts visuels : Olivier Lerch. N'hésitez pas à solliciter un rendez-vous pour être accompagnée dans la constitution de votre dossier.",
    contact_intitution_email: [" cap.bretagne@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Bretagne/Aides-et-demarches/Arts-visuels-cinema-livre-et-lecture-spectacle-vivant/Arts-visuels",
  )

help20.save

help21 = Help.new(
    identifiant: "AIABFC",
    institution_name: "DRAC Bourgogne-Franche-Comté",
    title: "Aide à l'installation d'atelier et à l'achat de matériel (AIA)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour accompagner l’aménagement d’un local de travail ou l’acquisition de matériel non consommable.",
    description_url: "https://www.culture.gouv.fr/Aides-demarches/Appels-a-projets/Candidatures-AIA-AIC",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 50 % du budget",
    residence_condition: "Bourgogne-Franche-Comté",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Cette aide ne peut être allouée que tous les 4 ans ; Il est interdit de candidater à l'AIA dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://mesdemarches.culture.gouv.fr/mcc/requests/ARTSP_AIDES_allocation_02/",
    selection: "Les demandes sont examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    url_commission: "https://www.culture.gouv.fr/Media/Medias-creation-rapide/arrete_membres_commission_AP.pdf",
    old_laureat: "6 aides attribuées en 2020 en Bourgogne Franche Comté, dont deux pour l'acquisition de matériel photographique et vidéo. ",
    old_laureat_url: "https://www.culture.gouv.fr/Media/Medias-creation-rapide/AIC_AIA_LISTE_ARTISTES_AIDES_ANNEES_ANTERIEURES.pdf2",
    help_type: ["Matériel"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    other_attachment: "<ul><li>attestation du ou de la propriétaire autorisant les travaux</li> <li>devis pour l’aménagement ou l’achat de matériel</li> <li> plans avant et après l’aménagement le cas échéant.</li></ul>",
    contact_institution: "Conseillers pour les arts plastiques : Rémy Fenzy, référent sur le site de Dijon, et Corinne Gambi, référente sur le site de Besançon.",
    contact_intitution_email: ["remy.fenzy@culture.gouv.fr","corinne.gambi@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Bourgogne-Franche-Comte/Votre-DRAC/Creation-Industries-et-Actions-Culturelles/Arts-Plastiques",
  )

help21.save

help21bis = Help.new(
    identifiant: "AIAIDF",
    institution_name: "DRAC Ile-de-France",
    title: "Aide à l'installation d'atelier et à l'achat de matériel (AIA)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour accompagner l’aménagement d’un local de travail ou l’acquisition de matériel non consommable.",
    description_url: "https://www.culture.gouv.fr/Regions/Drac-Ile-de-France/Aides-et-demarches/Departements-des-arts-visuels",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 50 % du budget",
    residence_condition: "Ile-de-France",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Cette aide ne peut être allouée que tous les 4 ans ; Il est interdit de candidater à l'AIA dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://mesdemarches.culture.gouv.fr/mcc/requests/ARTSP_AIDES_allocation_02/",
    selection: "Les demandes sont examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    help_type: ["Matériel"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    other_attachment: "<ul><li>attestation du ou de la propriétaire autorisant les travaux</li> <li>devis pour l’aménagement ou l’achat de matériel</li> <li> plans avant et après l’aménagement le cas échéant.</li></ul>",
    contact_institution: "Conseillère aux arts visuels : Isabelle Boulord",
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Ile-de-France/Aides-et-demarches/Departements-des-arts-visuels",
  )

help21bis.save

help22 = Help.new(
    identifiant: "AIAC",
    institution_name: "DRAC Corse",
    title: "Aide à l'installation d'atelier et à l'achat de matériel (AIA)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour accompagner l’aménagement d’un local de travail ou l’acquisition de matériel non consommable.",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 50 % du budget",
    residence_condition: "Corse",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Cette aide ne peut être allouée que tous les 4 ans ; Il est interdit de candidater à l'AIA dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    selection: "Les demandes sont examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    help_type: ["Matériel"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    other_attachment: "<ul><li>attestation du ou de la propriétaire autorisant les travaux</li> <li>devis pour l’aménagement ou l’achat de matériel</li> <li> plans avant et après l’aménagement le cas échéant.</li></ul>",
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Corse/DRAC",
  )

help22.save

help23 = Help.new(
    identifiant: "AIACVL",
    institution_name: "DRAC Centre-Val de Loire",
    title: "Aide à l'installation d'atelier et à l'achat de matériel (AIA)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour accompagner l’aménagement d’un local de travail ou l’acquisition de matériel non consommable.",
    description_url: "https://www.culture.gouv.fr/Regions/Drac-Centre-Val-de-Loire/Vos-demarches/Subventions/Arts-plastiques-Photographie-Multimedia/AIDE-INDIVIDUELLE-A-LA-CREATION",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 50 % du budget",
    residence_condition: "Centre-Val de Loire",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Cette aide ne peut être allouée que tous les 4 ans ; Il est interdit de candidater à l'AIA dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://mesdemarches.culture.gouv.fr/mcc/requests/ARTSP_AIDES_allocation_02/",
    selection: "Les demandes sont examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    url_commission: "https://www.prefectures-regions.gouv.fr/centre-val-de-loire/content/download/57885/380715/file/%20recueil-r24-2019-134%20du%2002%20mai%202019.pdf",
    help_type: ["Matériel"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    other_attachment: "<ul><li>attestation du ou de la propriétaire autorisant les travaux</li> <li>devis pour l’aménagement ou l’achat de matériel</li> <li> plans avant et après l’aménagement le cas échéant.</li></ul>",
    contact_institution: "Conseiller pour les arts visuels : Jean-Christophe Royoux",
    contact_intitution_email: ["artsplastiques.centre@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Centre-Val-de-Loire/Vos-demarches/Subventions/Arts-plastiques-Photographie-Multimedia",
  )

help23.save

help24 = Help.new(
    identifiant: "AIAG",
    institution_name: "DRAC Guadeloupe",
    title: "Aide à l'installation d'atelier et à l'achat de matériel (AIA)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour accompagner l’aménagement d’un local de travail ou l’acquisition de matériel non consommable.",
    description_url: "https://www.culture.gouv.fr/Media/Medias-creation-rapide/Demande-d-installation-atelier-Gpe-2020.doc",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 50 % du budget",
    residence_condition: "Guadeloupe",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Cette aide ne peut être allouée que tous les 4 ans ; Il est interdit de candidater à l'AIA dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://www.culture.gouv.fr/Media/Medias-creation-rapide/Demande-d-installation-atelier-Gpe-2020.doc",
    selection: "Un premier dossier comprenant au moins une note d’intention artistique, un CV et un budget prévisionnel doit être envoyé avant le 20 décembre 2021. Les demandes seront ensuite examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    help_type: ["Matériel"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    other_attachment: "<ul><li>attestation du ou de la propriétaire autorisant les travaux</li> <li>devis pour l’aménagement ou l’achat de matériel</li> <li> plans avant et après l’aménagement le cas échéant.</li></ul>",
    contact_institution: "Conseillère pour les arts visuels : Valérie Labayle",
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Dac-Guadeloupe/Disciplines-et-secteurs/Arts-plastiques ",
  )

help24.save

help25 = Help.new(
    identifiant: "AIAGE",
    institution_name: "DRAC Grand-Est",
    title: "Aide à l'installation d'atelier et à l'achat de matériel (AIA)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour accompagner l’aménagement d’un local de travail ou l’acquisition de matériel non consommable.",
    description_url: "https://www.culture.gouv.fr/Regions/Drac-Grand-Est/aides/subventions/arts-visuels/AIA",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 50 % du budget",
    residence_condition: "Grand-Est",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Cette aide ne peut être allouée que tous les 4 ans ; Il est interdit de candidater à l'AIA dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://www.demarches-simplifiees.fr/commencer/allocation-installation",
    selection: "Les demandes sont examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    url_commission: "https://www.culture.gouv.fr/Media/Regions/Drac-Grand-Est/Files/Creation/Arts-plastiques/Arrete-du-prefet-de-region-Membres-de-la-commission-Aides-deconcentrees-Arts-plastiques-Grand-Est-2021-2023",
    help_type: ["Matériel"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    other_attachment: "<ul><li>attestation du ou de la propriétaire autorisant les travaux</li> <li>devis pour l’aménagement ou l’achat de matériel</li> <li> plans avant et après l’aménagement le cas échéant.</li></ul>",
    contact_institution: "Conseillers pour les arts plastiques : <ul><li>Laurent Innocenzi, référent sur les départements 08, 10, 51, 52, 54, et 55</li><li> Bernard Goy, référent sur les départements 57, 88, 67 et 68.</li></ul>",
    contact_intitution_email: ["laurent.innocenzi@culture.gouv.fr","bernard.goy@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Grand-Est/Creation/Arts-visuels",
  )

help25.save

help26 = Help.new(
    identifiant: "AIAGY",
    institution_name: "DAC Guyane",
    title: "Aide à l'installation d'atelier et à l'achat de matériel (AIA)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour accompagner l’aménagement d’un local de travail ou l’acquisition de matériel non consommable.",
    description_url: "https://www.culture.gouv.fr/Regions/Dac-Guyane/Aides-et-demarches/Arts-plastiques",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,07,31),
    help_amount: "Jusqu'à 50 % du budget",
    residence_condition: "Guyane",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Cette aide ne peut être allouée que tous les 4 ans ; Il est interdit de candidater à l'AIA dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://www.culture.gouv.fr/Regions/Dac-Guyane/Aides-et-demarches/Arts-plastiques",
    selection: "Les demandes sont examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    old_laureat: "5 aides attribuées en 2021 en Guyane, dont 2 à des femmes, sur 6 candidatures. ",
    help_type: ["Matériel"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    other_attachment: "<ul><li>attestation du ou de la propriétaire autorisant les travaux</li> <li>devis pour l’aménagement ou l’achat de matériel</li> <li> plans avant et après l’aménagement le cas échéant.</li></ul>",
    contact_institution: "Conseillère pour les arts visuels : Sandrine Moreau",
    contact_intitution_email: ["sandrine.moreau@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Dac-Guyane/Aides-et-demarches/Arts-plastiques",
  )

help26.save

help27 = Help.new(
    identifiant: "AIAHDF",
    institution_name: "DRAC Hauts de France",
    title: "Aide à l'installation d'atelier et à l'achat de matériel (AIA)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour accompagner l’aménagement d’un local de travail ou l’acquisition de matériel non consommable.",
    description_url: "https://www.culture.gouv.fr/Regions/Drac-Hauts-de-France/Politique-et-actions-des-services/Pole-creation/Arts-visuels/Aides-destinees-aux-artistes-auteurs-arts-visuels",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 50 % du budget",
    residence_condition: "Hauts de France",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Cette aide ne peut être allouée que tous les 4 ans ; Il est interdit de candidater à l'AIA dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://mesdemarches.culture.gouv.fr/mcc/requests/ARTSP_AIDES_allocation_02/",
    selection: "Les demandes sont examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    help_type: ["Matériel"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    other_attachment: "<ul><li>attestation du ou de la propriétaire autorisant les travaux</li> <li>devis pour l’aménagement ou l’achat de matériel</li> <li> plans avant et après l’aménagement le cas échéant.</li></ul>",
    contact_institution: "Conseiller et conseillère pour les arts plastiques et visuels : <ul><li>Françoise Dubois, référente dans les départements 02, 60, 80</li><li> Eric Jarrot, référent pour les départements 59 et 62.</li></ul>",
    contact_intitution_email: ["francoise.dubois@culture.gouv.fr","eric.jarrot@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Hauts-de-France/Politique-et-actions-des-services/Pole-creation/Arts-visuels",
  )

help27.save

help28 = Help.new(
    identifiant: "AIAIDF",
    institution_name: "DRAC Ile-de-France",
    title: "Aide à l'installation d'atelier et à l'achat de matériel (AIA)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour accompagner l’aménagement d’un local de travail ou l’acquisition de matériel non consommable.",
    description_url: "https://www.culture.gouv.fr/Regions/Drac-Ile-de-France/Aides-et-demarches/Departements-des-arts-visuels",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 50 % du budget",
    residence_condition: "Ile-de-France",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Cette aide ne peut être allouée que tous les 4 ans ; Il est interdit de candidater à l'AIA dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://mesdemarches.culture.gouv.fr/mcc/requests/ARTSP_AIDES_allocation_02/",
    selection: "Les demandes sont examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    help_type: ["Matériel"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    other_attachment: "<ul><li>attestation du ou de la propriétaire autorisant les travaux</li> <li>devis pour l’aménagement ou l’achat de matériel</li> <li> plans avant et après l’aménagement le cas échéant.</li></ul>",
    contact_institution: "Conseillère aux arts visuels :  Isabelle Boulord",
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Ile-de-France/Aides-et-demarches/Departements-des-arts-visuels",
  )

help28.save

help29 = Help.new(
    identifiant: "AIAM",
    institution_name: "DAC Martinique",
    title: "Aide à l'installation d'atelier et à l'achat de matériel (AIA)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour accompagner l’aménagement d’un local de travail ou l’acquisition de matériel non consommable.",
    description_url: "https://www.culture.gouv.fr/Regions/DAC-Martinique/Disciplines-et-secteurs/Arts-plastiques",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,03,31),
    help_amount: "Jusqu'à 50 % du budget",
    residence_condition: "Martinique",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Cette aide ne peut être allouée que tous les 4 ans ; Il est interdit de candidater à l'AIA dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    selection: "Les demandes sont examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    old_laureat: "4 aides attribuées en 2018 en Martinique, dont 3 attribuées à des femmes.",
    old_laureat_url: "https://www.culture.gouv.fr/Regions/DAC-Martinique/Disciplines-et-secteurs/Arts-plastiques",
    help_type: ["Matériel"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    other_attachment: "<ul><li>attestation du ou de la propriétaire autorisant les travaux</li> <li>devis pour l’aménagement ou l’achat de matériel</li> <li> plans avant et après l’aménagement le cas échéant.</li></ul>",
    contact_institution: "Conseiller pour les arts plastiques et visuels : Anthoni Dominguez",
    contact_institution_url: "https://www.culture.gouv.fr/Regions/DAC-Martinique/Disciplines-et-secteurs/Arts-plastiques",
  )

help29.save

help30 = Help.new(
    identifiant: "AIAMY",
    institution_name: "DAC Mayotte",
    title: "Aide à l'installation d'atelier et à l'achat de matériel (AIA)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour accompagner l’aménagement d’un local de travail ou l’acquisition de matériel non consommable.",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,05,31),
    help_amount: "Jusqu'à 50 % du budget",
    residence_condition: "Mayotte",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Cette aide ne peut être allouée que tous les 4 ans ; Il est interdit de candidater à l'AIA dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    selection: "Les demandes sont examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.
      Les candidatures doivent être addessées par courriel à dac-mayotte@culture.gouv.fr",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    help_type: ["Matériel"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    other_attachment: "<ul><li>attestation du ou de la propriétaire autorisant les travaux</li> <li>devis pour l’aménagement ou l’achat de matériel</li> <li> plans avant et après l’aménagement le cas échéant.</li></ul>",
    contact_institution: "Conseillère pour la création artistique : Gaëlle Metelus",
    contact_intitution_email: ["gaelle.metelus@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Dac-Mayotte/Action-culturelle-et-artistique/La-creation/Les-Aides-a-la-creation",
  )

help30.save

help31 = Help.new(
    identifiant: "AIAN",
    institution_name: "DRAC Normandie",
    title: "Aide à l'installation d'atelier et à l'achat de matériel (AIA)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour accompagner l’aménagement d’un local de travail ou l’acquisition de matériel non consommable.",
    description_url: "https://www.culture.gouv.fr/Regions/Drac-Normandie/Aides-et-demarches/Aides-et-demarches-pour-la-creation-artistique-et-le-developpement-des-publics/Aides-concernant-le-secteur-des-arts-plastiques",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 50 % du budget",
    residence_condition: "Normandie",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Cette aide ne peut être allouée que tous les 4 ans ; Il est interdit de candidater à l'AIA dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://mesdemarches.culture.gouv.fr/mcc/requests/ARTSP_AIDES_allocation_02/",
    selection: "Les demandes sont examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    url_commission: "https://www.culture.gouv.fr/content/download/205668/file/Arrete_2019.pdf?inLanguage=fre-FR",
    help_type: ["Matériel"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    other_attachment: "<ul><li>attestation du ou de la propriétaire autorisant les travaux</li> <li>devis pour l’aménagement ou l’achat de matériel</li> <li> plans avant et après l’aménagement le cas échéant.</li></ul>",
    contact_institution: "Conseiller pour les arts plastiques et visuels : Jérôme Felin.  N'hésitez pas à solliciter un rendez-vous pour être accompagnée dans la constitution de votre dossier.",
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Normandie/Aides-et-demarches/Aides-et-demarches-pour-la-creation-artistique-et-le-developpement-des-publics",
  )

help31.save

help32 = Help.new(
    identifiant: "AIAO",
    institution_name: "DRAC Occitanie",
    title: "Aide à l'installation d'atelier et à l'achat de matériel (AIA)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour accompagner l’aménagement d’un local de travail ou l’acquisition de matériel non consommable.",
    description_url: "https://www.culture.gouv.fr/Regions/Drac-Occitanie/Aides-et-demarches/Aides-et-subventions/Aides-Arts-plastiques",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 50 % du budget",
    residence_condition: "Occitanie",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Cette aide ne peut être allouée que tous les 4 ans ; Il est interdit de candidater à l'AIA dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://mesdemarches.culture.gouv.fr/mcc/requests/ARTSP_AIDES_allocation_02/",
    selection: "Les demandes sont examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    help_type: ["Matériel"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    other_attachment: "<ul><li>attestation du ou de la propriétaire autorisant les travaux</li> <li>devis pour l’aménagement ou l’achat de matériel</li> <li> plans avant et après l’aménagement le cas échéant.</li></ul>",
    contact_institution: "Conseillères pour les arts plastiques : <ul><li>Catherine Dumon, référente sur le site de Montpellier</li><li>Marie-Béatrice Angelé, référente sur le site de Toulouse.</li></ul>N'hésitez pas à solliciter un rendez-vous pour être accompagnée dans la constitution de votre dossier.",
    contact_intitution_email: ["catherine.dumon@culture.gouv.fr","artsplastiques.occitanie@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Occitanie/Aides-et-demarches/Aides-et-subventions/Aides-Arts-plastiques"
  )

help32.save

help33 = Help.new(
    identifiant: "AIAPACA",
    institution_name: "DRAC Provence-Alpes-Côte-d'Azur",
    title: "Aide à l'installation d'atelier et à l'achat de matériel (AIA)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour accompagner l’aménagement d’un local de travail ou l’acquisition de matériel non consommable.",
    description_url: "https://www.culture.gouv.fr/Regions/Drac-Provence-Alpes-Cote-d-Azur/Aides-demarches/Aides-financieres/Aides-aux-artistes-plasticiens",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 50 % du budget",
    residence_condition: "Provence-Alpes-Côte-d'Azur",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Cette aide ne peut être allouée que tous les 4 ans ; Il est interdit de candidater à l'AIA dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://www.demarches-simplifiees.fr/commencer/allocation-installation",
    selection: "Les demandes sont examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    url_commission: "https://www.culture.gouv.fr/Media/Regions/Drac-Paca/Files/Aides-demarches/Aides-financieres/Arts-plastiques/Commission-consultative-d-aides-a-la-creation-et-des-allocations-d-installation-d-atelier-2020-2022",
    help_type: ["Matériel"],
    old_laureat: "Une dizaine d'aides attribuées en 2020 en Provence-Alpes-Côte-d'Azur, de façon paritaire.",
    old_laureat_url: "https://www.culture.gouv.fr/Regions/Drac-Provence-Alpes-Cote-d-Azur/Aides-demarches/Aides-financieres/Aides-aux-artistes-plasticiens",
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    other_attachment: "<ul><li>attestation du ou de la propriétaire autorisant les travaux</li> <li>devis pour l’aménagement ou l’achat de matériel</li> <li> plans avant et après l’aménagement le cas échéant.</li></ul>",
    contact_institution: "Conseillère pour les arts visuels : Aurélie Hence",
    contact_intitution_email: ["aurelie.hance@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Provence-Alpes-Cote-d-Azur",
  )

help33.save

help34 = Help.new(
    identifiant: "AIAPDL",
    institution_name: "DRAC Pays de la Loire",
    title: "Aide à l'installation d'atelier et à l'achat de matériel (AIA)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour accompagner l’aménagement d’un local de travail ou l’acquisition de matériel non consommable.",
    description_url: "https://www.culture.gouv.fr/Regions/Drac-Pays-de-la-Loire/Vos-demarches-et-documentations/Arts-plastiques-et-metiers-d-art",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 50 % du budget",
    residence_condition: "Pays de la Loire",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Cette aide ne peut être allouée que tous les 4 ans ; Il est interdit de candidater à l'AIA dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://mesdemarches.culture.gouv.fr/mcc/requests/ARTSP_AIDES_allocation_02/",
    selection: "Les demandes sont examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    help_type: ["Matériel"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    other_attachment: "<ul><li>attestation du ou de la propriétaire autorisant les travaux</li> <li>devis pour l’aménagement ou l’achat de matériel</li> <li> plans avant et après l’aménagement le cas échéant.</li></ul>",
    contact_intitution_email: ["arts-plastiques.paysdelaloire@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Drac-Pays-de-la-Loire/Vos-demarches-et-documentations/Arts-plastiques-et-metiers-d-art",
  )

help34.save

help35 = Help.new(
    identifiant: "AIAR",
    institution_name: "DAC Réunion",
    title: "Aide à l'installation d'atelier et à l'achat de matériel (AIA)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour accompagner l’aménagement d’un local de travail ou l’acquisition de matériel non consommable.",
    description_url: "https://www.culture.gouv.fr/Regions/Dac-de-La-Reunion/A-la-une/Aide-a-la-creation-individuelle-allocations-d-installation-d-atelier-et-achat-de-materiel-2021",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 50 % du budget",
    residence_condition: "Réunion",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Cette aide ne peut être allouée que tous les 4 ans ; Il est interdit de candidater à l'AIA dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    candidate_url: "https://mesdemarches.culture.gouv.fr/mcc/requests/ARTSP_AIDES_allocation_02/",
    selection: "Les demandes sont examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    help_type: ["Matériel"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    other_attachment: "<ul><li>attestation du ou de la propriétaire autorisant les travaux</li> <li>devis pour l’aménagement ou l’achat de matériel</li> <li> plans avant et après l’aménagement le cas échéant.</li></ul>",
    contact_institution: "Conseillère pour les arts plastiques et visuels : Natacha Provensal",
    contact_intitution_email: ["natacha.provensal@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/Dac-de-La-Reunion/A-la-une/Aide-a-la-creation-individuelle-allocations-d-installation-d-atelier-et-achat-de-materiel-2021",
  )

help35.save

help36 = Help.new(
    identifiant: "AIANA",
    institution_name: "DRAC Nouvelle-Aquitaine",
    title: "Aide à l'installation d'atelier et à l'achat de matériel (AIA)",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour accompagner l’aménagement d’un local de travail ou l’acquisition de matériel non consommable.",
    start_date: Date.new(2022,1,1),
    end_date: Date.new(2022,02,28),
    help_amount: "Jusqu'à 50 % du budget",
    residence_condition: "Nouvelle-Aquitaine",
    general_condition: "Réservé à la création artistique ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande ; Cette aide ne peut être allouée que tous les 4 ans ; Il est interdit de candidater à l'AIA dans plusieurs régions ; Cette aide n'est pas cumulable avec la plupart des aides publiques la même année.",
    selection: "Les demandes sont examinées par une commission. Elle émet un avis au vu de la qualité et du professionnalisme du dossier artistique ainsi que de l’ensemble des pièces fournies, y compris de l’équilibre du budget.",
    compo_commission: "Elle est fixée par arrêté du préfet ou de la préfète de région. Elle est paritaire (mais les membres peuvent être représentés).",
    help_type: ["Matériel"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>fiche SIREN</li>
    <li>RIB</li>
    <li>justificatif de résidence</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul><li>portfolio</li> <li>note de présentation du projet</li> <li> montant détaillé des dépenses et du financement prévu</li></ul>",
    other_attachment: "<ul><li>attestation du ou de la propriétaire autorisant les travaux</li> <li>devis pour l’aménagement ou l’achat de matériel</li> <li> plans avant et après l’aménagement le cas échéant.</li></ul>",
    contact_institution: "<ul><li>Conseillers pour les arts plastiques : Bertrand FLEURY, référent sur les départements 17, 33, 40, 47, 64, 79</li><li>et  Mathieu BORDES, référent sur les départements 16, 19, 23, 24, 86, 87.</li></ul>",
    contact_intitution_email: ["bertrand.fleury@culture.gouv.fr","mathieu.bordes@culture.gouv.fr"],
    contact_institution_url: "https://www.culture.gouv.fr/Regions/DRAC-Nouvelle-Aquitaine/Creation-Industries-culturelles/Arts-plastiques",
  )

help36.save

# SAIF
help37 = Help.new(
    identifiant: "SAIFLT",
    institution_name: "SAIF (Société des auteurs des arts visuels et de l’image fixe)",
    institution_partenaire: ["Association Laurent Troude", "Libération", "Divergence-Images","le festival ImageSingulières"],
    title: "Bourse Laurent Troude",
    regularity: "Une fois par an",
    sector: "Photographie",
    description: "Pour soutenir le travail de création des jeunes photographes.",
    description_url: "https://www.saif.fr/soutien-a-la-creation/",
    start_date: Date.new(2022,2,1),
    end_date: Date.new(2022,04,30),
    help_amount: "8,000 €",
    help_advantage: "Un an d’abonnement à la plateforme Divergence-Images ; Exposition au festival lmageSingulières ; Diffusion dans Libération.",
    residence_condition: "Française ou résidant en France",
    general_condition: "Avoir moins de 30 ans ; Présenter des œuvres originales et inédites",
    specific_condition: "Le projet ne peut être présenté à aucun autre prix, concours ou bourse, ni publié avant sa présentation au festival ; Le projet doit être achevé en mars de l’année suivante ; L’artiste doit assister au festival.",
    candidate_url: "https://www.saif.fr/site/assets/files/1477/formulairecandidature2021.pdf",
    selection: "Les demandes sont examinées par un jury, qui émet un avis au vu de la qualité des photographies et de la pertinence du projet. Le projet doit être en lien avec le territoire français, dans un format propre au journalisme. Envoyer le formulaire de candidature par WeTransfer aux deux contacts cités plus bas",
    compo_commission: "Le jury est constitué de la personne lauréate de l’année précédente et de représentantes et représentants de l’institution et des partenaires. En 2021, le jury était composé de 5 hommes et 2 femmes",
    url_commission: "https://www.saif.fr/soutien-a-la-creation/",
    old_laureat: "Une personne lauréate par an. Le jury peut distinguer deux autres artistes.",
    old_laureat_url: "https://arthurmercier.fr/",
    help_type: ["Diffusion", "Production"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>formulaire de candidature</li>
    </ul>",
    artistic_attachment: "<ul><li>note d’intention (1 page) </li> <li> 5 à 10 visuels numérotés et spécifiques au projet</li> <li> document texte avec les légendes des images.</li></ul>",
    contact_intitution_email: ["bourselaurenttroude@gmail.com","actionculturelle@saif.fr"],
    contact_institution_url: "https://www.saif.fr/soutien-a-la-creation/",
    contact_intitution_partenaire: ["https://www.liberation.fr/", "http://www.divergence-images.com/", "https://www.imagesingulieres.com/"]
  )

help37.save

# IFED

help39 = Help.new(
    identifiant: "IFED",
    institution_name: "Institut Français",
    institution_partenaire: ["Fondation FACE"],
    title: "Résidence Etant Données",
    regularity: "Une fois par an",
    sector: "Arts plastiques et arts visuels",
    description: "Pour accompagner les artistes qui souhaitent réaliser un projet aux États-Unis",
    description_url: "https://www.pro.institutfrancais.com/fr/offre/residences-etant-donnes",
    residence_time: "2 à 4 mois",
    start_date: Date.new(2021,11,1),
    end_date: Date.new(2022,01,30),
    help_amount: " Jusqu'à 10 000 €",
    help_advantage: "Transport, hébergement et visa",
    residence_condition: "Française ou résidant en France",
    general_condition: "Française ou résidant en France depuis plus de 5ans. Parler anglais ; Avoir un parcours professionnel significatif",
    specific_condition: "Identifier une structure partenaire aux États-Unis pour accompagner le projet (conseil, accès aux réseaux locaux, production, diffusion). La structure peut être un centre d'art, un musée, une galerie, une bibliothèque ou une université.",
    selection: "Les demandes sont examinées par un jury, qui émet un avis au vu de la qualité du projet, de son lien avec des enjeux locaux, de son inscription dans la carrière de l’artiste, et de la relation établie avec le partenaire aux États-Unis.",
    old_laureat: "3 personnes lauréates par an.",
    help_type: ["Production", "Résidence"],
    admin_attachment: "<ul>
    <li>CV (français et anglais)</li>
    </ul>",
    artistic_attachment: "<ul>
    <li>Portfolio </li> 
    <li> note d’intention (français et anglais)</li>
    <li> budget prévisionnel (dont transport et hébergement)</li>
    </ul>",
    other_attachment: "<ul>
    <li>Présentation du partenaire (français et anglais)</li> 
    <li>lettre d’engagement du partenaire (anglais)</li>
    <li>lettre d’engagement d’une galerie française si l’artiste est représentée (anglais)</li>
    </ul>",
    contact_institution: "Institut Français : Mathilde Lajarridge, chargée de projet Résidences ; services culturels de l’ambassade de France aux Etats-Unis et Fondation FACE : Olivier Le Falher",
    contact_intitution_email: ["mathilde.lajarrige@institutfrancais.com","visualarts@face-foundation.org"],
    contact_institution_url: "https://www.pro.institutfrancais.com/fr/offre/residences-etant-donnes",
    contact_intitution_partenaire: ["https://face-foundation.org/artistic-funds/etant-donnes-contemporary-art/etant-donnes-residencies/"]
  )

help39.save

# CIA
help40 = Help.new(
    identifiant: "CIAO",
    institution_name: "Cité internationale des arts",
    title: "Résidence Ondes",
    regularity: "Une fois par an",
    sector: "Arts visuels, architecture, cinéma, écriture, musique et spectacle vivant.",
    description: "Pour accueillir les artistes d’outre-mer à Paris",
    description_url: "https://www.citedesartsparis.net/fr/programme-ondes-2021",
    residence_time: "3 mois",
    start_date: Date.new(2021,11,1),
    end_date: Date.new(2022,01,30),
    help_amount: "750 € par mois",
    help_advantage: "Atelier-logement à Paris ; transport en avion ; accompagnement artistique et professionnel",
    residence_condition: "Française résidant en outre-mer",
    general_condition: "Pouvoir témoigner d’une pratique artistique professionnelle de plus de 5 ans",
    faq_url: "https://www.citedesartsparis.net/fr/programme-ondes-2021",
    selection: "La commission émet un avis au vu de la qualité du projet, du parcours professionnel de l’artiste, de la nécessité du séjour à Paris et des contacts établis ou souhaités à Paris.",
    compo_commission: "La commission est composée de personnalités qualifiées. En 2021, elle était composée de 3 femmes et 2 hommes.",
    url_commission: "https://manager.artishocsite.com/media/cia/183726-cp_laure_ats_ondes_2021.pdf",
    old_laureat: "5 personnes lauréates sur 33 candidatures en 2021, dont 3 femmes lauréates.",
    old_laureat_url: "https://manager.artishocsite.com/media/cia/183726-cp_laure_ats_ondes_2021.pdf",
    help_type: ["Production","Résidence"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>justificatif de résidence</li>
    </ul>",
    artistic_attachment: "<ul>
    <li>Portfolio (5 à 20 pages)</li> 
    <li>note d’intention (2 à 4 pages) </li>
    <li>liens vers des fichiers audio ou vidéo représentatifs du travail.</li>
    </ul>",
    other_attachment: "<ul>
    <li>Une ou plusieurs lettres de recommandations</li>
    </ul>",
    parentality: "L’artiste peut être accompagnée d’un enfant de moins de 7 ans (119€ par mois à la charge de l’artiste) et/ou d’une autre personne (163 € par mois).",
    accessibility: "Les ateliers-logements ne répondent pas aux normes actuelles d’accessibilité́ aux personnes en situation de handicap.",
    contact_institution: "Service résidences de la Cité internationale des arts",
    contact_intitution_email: ["commissions@citedesartsparis.fr"],
    contact_institution_url: "https://www.citedesartsparis.net/fr/residences/comment-resider-a-la-cite",
    contact_intitution_partenaire: ["https://face-foundation.org/artistic-funds/etant-donnes-contemporary-art/etant-donnes-residencies/"]
  )

help40.save

# CNAPS
help41 = Help.new(
    identifiant: "CNAPS",
    institution_name: "CNAP  (Centre national des arts plastiques, opérateur de la politique du ministère de la Culture en matière d’arts plastiques et d’arts visuels)",
    title: "Secours exceptionnel",
    regularity: "Trois fois par an",
    sector: "Arts plastiques et arts visuels",
    description: "Pour aider ponctuellement des artistes rencontrant des difficultés momentanées et exceptionnelles ne leur permettant plus d’exercer leur activité artistique de manière professionnelle et constante.",
    description_url: "https://www.cnap.fr/navigation/soutien-la-creation/secours-exceptionnel/modalites-de-candidature",
    residence_time: "3 mois",
    start_date: Date.new(2021,9,20),
    end_date: Date.new(2021,11,16),
    help_amount: "1,500 €",
    residence_condition: "Française ou résidant en France",
    general_condition: "Interruption temporaire d’activité artistique ; Revenu fiscal de référence par part < 18 000 €",
    specific_condition: "Un refus empêche de candidater l’année suivante ; le délai de carence entre deux soutiens est de deux ans",
    candidate_url: "https://www.cnap.fr/sites/default/files/Secours%20exceptionnel-Tutoriel%20des%20aides%20du%20Cnap.pdf",
    faq_url: "https://www.cnap.fr/soutien-la-creation/secours-exceptionnel/secours-exceptionnel/faq",
    selection: "Les demandes sont examinées par une commission, qui émet un avis au vu du professionnalisme de l’artiste, et de l’impact de ses difficultés sur sa carrière et ses capacités de production. L’accompagnement par les services sociaux locaux est également pris en compte.",
    compo_commission: "La commission est composée de membres de droits, de représentants des organisations syndicales des artistes-auteurs et de deux personnalités qualifiées (1 homme et 1 femme)",
    url_commission: "https://www.cnap.fr/soutien-la-creation/artistes/secours-exceptionnel/membres-commission",
    old_laureat: "121 photographes lauréates et lauréats (dont 59 femmes et 62 hommes) sur 130 personnes candidates en 2021. Tous secteurs confondus, 806 artistes ont reçu ce soutien en 2021.",
    help_type: ["Aide Sociale"],
    admin_attachment: "<ul>
    <li>pièce d’identité</li>
    <li>affiliation à la sécurité sociale des artistes-auteurs</li>
    <li>avis SIRENE</li>
    <li>RIB</li>
    <li>dernier avis d’imposition</li>
    </ul>",
    artistic_attachment: "<ul>
    <li>CV artistique</li>
    <li>Portfolio (10 visuels minimum)</li>
    </ul>",
    contact_institution: "Estelle Moy, chargée des soutiens aux artistes",
    contact_intitution_email: ["estelle.moy@cnap.fr"],
    contact_institution_url: "https://www.cnap.fr/navigation/soutien-la-creation/secours-exceptionnel/modalites-de-candidature",
  )

help41.save

# CNAPD
help42 = Help.new(
    identifiant: "CNAPD",
    institution_name: "CNAP  (Centre national des arts plastiques, opérateur de la politique du ministère de la Culture en matière d’arts plastiques et d’arts visuels)",
    title: "Soutien à la photographie documentaire contemporaine",
    regularity: "Une fois par an",
    sector: "Arts visuels",
    description: "Pour accompagner le financement d'un projet photographique documentaire.",
    description_url: "https://www.cnap.fr/navigation/soutien-la-creation/photographes/modalites-de-candidature",
    residence_time: "3 mois",
    start_date: Date.new(2021,11,10),
    end_date: Date.new(2022,04,12),
    help_amount: "5 000, 10 000 ou 15 000 €",
    residence_condition: "Française ou résidant en France",
    general_condition: "Réservé aux professionnels ; Réservé aux projets documentaires",
    specific_condition: "Cette aide n'est pas cumulable avec les AIC des DRAC reçues l’année précédente ni avec les soutiens artistiques du CNAP (Soutien à un projet artistique et Soutien Image/mouvement) reçus les deux années précédentes ; Un refus empêche de candidater l’année suivante",
    selection: "Les demandes sont examinées par une commission qui émet un avis au vu de la faisabilité du projet, de la qualité et du professionnalisme du demandeur et du dossier artistique. Le travail de l’artiste doit s’inscrire dans un cadre professionnel avéré : expositions individuelles, publications, aides…",
    compo_commission: "Les personnalités qualifiées (6 femmes et 5 hommes) sont nommées par le CNAP pour 3 ans.",
    url_commission: "https://www.cnap.fr/soutien-la-creation/photographes/membres-commission",
    old_laureat: "53 lauréates et lauréats (dont 25 femmes et 30 hommes) sur 200 projets candidats en 2021. Le respect de la parité est pris en  compte au sein des aides comme des commissions du Cnap.",
    old_laureat_url:"https://www.cnap.fr/navigation/soutien-la-creation/photographes/r%C3%A9sultats",
    old_laureats_case_url: "https://www.cnap.fr/soutien-la-creation/photographes-documentaires/rapports-de-recherche",
    help_type: ["Production"],
    admin_attachment: "<ul>
    <li>CV</li>
    <li>pièce d’identité</li>
    <li>affiliation à la sécurité sociale des artistes-auteurs</li>
    <li>RIB</li>
    </ul>",
    artistic_attachment: "<ul><li>CV artistique</li><li>Portfolio (30 visuels)</li><li>note de présentation du projet (3 pages max) </li><li>5 visuels légendés illustrant le projet</li><li>budget prévisionnel et justificatifs de dépenses</li></ul>",
    other_attachment: "Pour les collectifs, liste des artistes et justificatif de l’indivision du groupe et pour les artistes hors de France, justificatif de résidence ou titre de séjour.",
    contact_institution: "Isabelle Smadja, chargée des soutiens aux photographes documentaires",
    contact_intitution_email: ["isabelle.smadja@cnap.fr"],
    contact_institution_url: "https://www.cnap.fr/navigation/soutien-la-creation/photographes/modalites-de-candidature",
  )

help42.save

# CNAPP
help43 = Help.new(
    identifiant: "CNAPP",
    institution_name: "CNAP  (Centre national des arts plastiques, opérateur de la politique du ministère de la Culture en matière d’arts plastiques et d’arts visuels)",
    title: "Soutien à un projet artistique",
    regularity: "Une fois par an",
    sector: "Arts plastiques et arts visuels",
    description: "Pour accompagner le financement d'un projet original de création, de la recherche à la production.",
    description_url: "https://www.cnap.fr/navigation/soutien-la-creation/artistes/modalites-de-candidature",
    residence_time: "3 mois",
    start_date: Date.new(2021,11,10),
    end_date: Date.new(2022,02,28),
    help_amount: "5 000, 10 000 ou 15 000 €",
    residence_condition: "Française ou résidant en France",
    general_condition: "Réservé à la création artistique (recherche et/ou production) ; Ne pas être étudiante",
    specific_condition: "Un projet collectif ne peut faire l'objet que d'une seule demande Cette aide n'est pas cumulable avec les AIC des DRAC reçues l’année précédente ni avec les soutiens artistiques du CNAP (Soutien à la photographie documentaire contemporaine et Image/mouvement) reçus les deux années précédentes ; Un refus empêche de candidater l’année suivante",
    selection: "Les demandes sont examinées par une commission, qui émet un avis au vu de la faisabilité du projet, de la qualité et du professionnalisme du demandeur et du dossier artistique. Le travail de l’artiste doit s’inscrire dans un cadre professionnel avéré : expositions individuelles, publications, aides…",
    compo_commission: "Les membres (7 femmes et 5 hommes) sont nommés par le CNAP pour 3 ans.",
    url_commission: "https://www.cnap.fr/soutien-la-creation/artistes/Arrete-du-prefet-de-region-Membres-de-la-commission-Aides-deconcentrees-Arts-plastiques-Grand-Est-2021-2023",
    old_laureat: "5 lauréates et lauréats (dont 3 femmes et 2 hommes) sur 32 projets photographiques candidats en 2021. Le respect de la parité est pris en  compte au sein des aides comme des commissions du Cnap.",
    old_laureat_url:"https://www.cnap.fr/navigation/soutien-la-creation/artistes/r%C3%A9sultats",
    old_laureats_case_url: "https://www.cnap.fr/soutien-la-creation/artistes/rapports-de-recherche",
    help_type: ["Production"],
    admin_attachment: "<ul>
    <li>Pièce d’identité</li>
    <li>affiliation à la sécurité sociale des artistes-auteurs</li>
    <li>RIB</li>
    </ul>",
    artistic_attachment: "<ul>
    <li>CV artistique</li>
    <li>portfolio (30 visuels)</li>
    <li>note de présentation du projet (7500 signes max)</li>
    <li>5 visuels légendés illustrant le projet</li>
    <li>budget prévisionnel et justificatifs de dépenses</li>
    </ul>",
    other_attachment: "Pour les collectifs, liste des artistes et justificatif de l’indivision du groupe et pour les artistes hors de France, justificatif de résidence ou titre de séjour.",
    contact_institution: "Estelle Moy, chargée des soutiens aux artistes",
    contact_intitution_email: ["estelle.moy@cnap.fr"],
    contact_institution_url: "https://www.cnap.fr/navigation/soutien-la-creation/artistes/modalites-de-candidature",
  )

help43.save

p "Create admin users"
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
