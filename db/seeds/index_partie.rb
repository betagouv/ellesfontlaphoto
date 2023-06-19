require "csv"
filepath = File.join(Rails.root, 'db', 'donnees_histo.csv')

CSV.foreach(filepath, headers: :first_row) do |row|
  p "Imports des nouveaux chiffres sur les anciennes organizations"
  organization = Organization.find(row["id"].to_i)
  new_chiffre = ChiffresOrganization.new(
    annee: row["annee"].to_i,
    nb_femmes_exposees_expo_collective: row["nb_femmes_exposees_expo_collective"].to_i,
    nb_total_exposes_expo_collective: row["nb_total_exposes_expo_collective"].to_i,
    nb_femmes_directrices: row["nb_femmes_directrices"].to_i,
    nb_total_directeurs: row["nb_total_directeurs"].to_i
  )
  new_chiffre.organization = organization
  new_chiffre.save
  p new_chiffre.valid?
  p new_chiffre.errors.messages
  p "chiffre organization pour #{organization.name} ajouté"
end


# filepath = File.join(Rails.root, 'db', 'nouvelles_orga.csv')

# CSV.foreach(filepath, headers: :first_row) do |row|
#   new_orga = Organization.new(
#     name: row["name"],
#     organization_type: row["organization_type"],
#     city: row["city"]
#   )
#   new_orga.save
#   p "nouvelle organization #{new_orga.name} ajouté"
# end

filepath = File.join(Rails.root, 'db', 'datas_nouvelles_orga.csv')
p "Imports des nouveaux chiffres sur les nouvelles organizations"
CSV.foreach(filepath, headers: :first_row) do |row|
  organization = Organization.where(name: row["name"]).first
  chiffre_orga = ChiffresOrganization.new(
    annee: row["annee"].to_i,
    nb_femmes_exposees_expo_collective: row["nb_femmes_exposees_expo_collective"].to_i,
    nb_total_exposes_expo_collective: row["nb_total_exposes_expo_collective"].to_i,
    nb_femmes_directrices: row["nb_femmes_directrices"].to_i,
    nb_total_directeurs: row["nb_total_directeurs"].to_i
  )
  chiffre_orga.organization = organization
  chiffre_orga.save
  p chiffre_orga.valid?
  p chiffre_orga.errors.messages
  p "chiffre organization pour #{chiffre_orga.annee} ajouté for #{organization.name}"
end

filepath = File.join(Rails.root, 'db', 'organizations-histo.csv')
p "Imports des chiffres historiques"
CSV.foreach(filepath, headers: :first_row) do |row|
  organization = Organization.find(row["id"].to_i)
  chiffre = ChiffresOrganization.new(
    nb_femmes_directrices: row["nb_femmes_directrices"].to_i,
    nb_total_directeurs: row["nb_total_directeurs"].to_i,
    nb_femmes_exposees: row["nb_femmes_exposees"].to_i,
    nb_total_exposes: row["nb_total_exposes"].to_i,
    nb_femmes_laureates: row["nb_femmes_laureates"].to_i,
    nb_total_laureates: row["nb_total_laureates"].to_i,
    nb_femmes_candidates: row["nb_femmes_candidates"].to_i,
    nb_total_candidats: row["nb_total_candidats"].to_i,
    nb_femmes_publiees: row["nb_femmes_publiees"].to_i,
    nb_total_publies: row["nb_total_publies"].to_i,
    nb_femmes_iconographes: row["nb_femmes_iconographes"].to_i,
    nb_total_iconographes: row["nb_total_iconographes"].to_i,
    nb_femmes_enseignantes: row["nb_femmes_enseignantes"].to_i,
    nb_total_enseignants: row["nb_total_enseignants"].to_i,
    nb_femmes_etudiantes: row["nb_femmes_etudiantes"].to_i,
    nb_total_etudiants: row["nb_total_etudiants"].to_i,
    annee: 2022,
    visible: true
  )
  chiffre.organization = organization
  p chiffre.valid?
  p chiffre.errors.messages
  p "chiffre organization pour #{organization.name} ajouté"
  chiffre.save
end
