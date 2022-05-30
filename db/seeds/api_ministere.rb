require "json"
require "open-uri"

 EQUIVALENT_RESIDENCE = {
  "- France entière -": "Française ou résidant en France",
  "Auvergne-Rhône-Alpes": "Auvergne-Rhône Alpes",
  "Bourgogne - Franche-Comté": "Bourgogne-Franche-Comté",
  "Bretagne": "Bretagne",
  "Centre-Val de Loire": "Centre-Val de Loire",
  "Collectivité d'outre-mer": "Française résidant en outre-mer",
  "Corse": "Corse",
  "En régions": "Française ou résidant en France",
  "Europe": "Française résidant à l'étranger",
  "Grand Est": "Grand-Est",
  "Guadeloupe": "Guadeloupe",
  "Guyane": "Guyane",
  "Hauts-de-France": "Hauts de France",
  "Ile-de-France": "Ile-de-France",
  "La Réunion": "Réunion",
  "Martinique": "Martinique",
  "Mayotte": "Mayotte",
  "Monde": "Française ou résidant en France",
  "Normandie": "Normandie",
  "Nouvelle-Aquitaine": "Nouvelle-Aquitaine",
  "Nouvelle-Calédonie": "Nouvelle-Calédonie",
  "Occitanie": "Occitanie",
  "Outre-mer": "Française résidant en outre-mer",
  "Pays de la Loire": "Pays de la Loire",
  "Provence-Alpes-Côte d'Azur": "Provence-Alpes-Côte-d'Azur",
  "Saint-Pierre-et-Miquelon": "Saint-Pierre-et-Miquelon"
}

url = "https://gouv.pr-744-ht2yqea-dkyixqmx5apwo.eu-2.platformsh.site/api/appel-a-projet"
appel_projet_serialized = URI.open(url).read
appel_projet = JSON.parse(appel_projet_serialized)

appel_projet["results"].each do |appel|
  if (appel["eztag_theme"].include? "Photographie") && (Help.where(api_id: appel["id"]).empty?)
    new_help = Help.new(
      visible: false,
      title: appel["title"],
      description_longue: appel["body"],
      candidate_url: appel["url"],
      residence_condition: EQUIVALENT_RESIDENCE[appel["eztag_region"].first.to_sym],
      start_date: Date.parse(appel["creationDate"]),
      end_date: Date.parse(appel["deadline"]),
      description: "À définir",
      help_amount: "À définir",
      api_id: appel["id"]
    )
    new_help.save
    new_candidature_date = CandidatureDate.new(start_date: Date.parse(appel["creationDate"]), end_date: Date.parse(appel["deadline"]), help: new_help)
  end
end
