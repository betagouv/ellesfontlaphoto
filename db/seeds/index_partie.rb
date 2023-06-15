require "csv"
filepath = File.join(Rails.root, 'db', 'donnees_histo.csv')

CSV.foreach(filepath, headers: :first_row) do |row|
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
end


filepath = File.join(Rails.root, 'db', 'nouvelles_orga.csv')

CSV.foreach(filepath, headers: :first_row) do |row|
  new_orga = Organization.new(
    name: row["name"],
    organization_type: row["organization_type"],
    city: row["city"]
  )
  new_orga.save
end

filepath = File.join(Rails.root, 'db', 'datas_nouvelles_orga.csv')

CSV.foreach(filepath, headers: :first_row) do |row|
  organization = Organization.where(name: row["name"]).first
  chiffre_orga = ChiffresOrganization.new(
    anne: row["annee"].to_i,
    nb_femmes_exposees_expo_collective: row["nb_femmes_exposees_expo_collective"].to_i,
    nb_total_exposes_expo_collective: row["nb_total_exposes_expo_collective"].to_i,
    nb_femmes_directrices: row["nb_femmes_directrices"].to_i,
    nb_total_directeurs: row["nb_total_directeurs"].to_i
  )
  chiffre_orga.organization = organization
end
