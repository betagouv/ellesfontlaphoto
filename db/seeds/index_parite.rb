require "csv"

ChiffresOrganization.destroy_all

p "Imports prix independants"
filepath = File.join(Rails.root, 'db', 'import_prix_independants.csv')
CSV.foreach(filepath, headers: :first_row) do |row|
  prix = Organization.new(
    name: row["name"],
    titre: row["name"],
    organization_type: "Prix",
    visible: true,
    page_structure: true
  )
  prix.save
  p prix.valid?
  p prix.errors.messages
  p "prix independant: #{prix.titre}"
end

p "Ajout chiffres pour prix associés à des organizations"
filepath = File.join(Rails.root, 'db', 'import_chiffres_prix_independants.csv')
CSV.foreach(filepath, headers: :first_row) do |row|
  prix = Organization.where(name: row["name"], organization_type: "Prix").first
  chiffres_prix = ChiffresOrganization.new(
    annee: row["annee"].to_i,
    nb_femmes_laureates: row["nb_femmes_laureates"].to_i,
    nb_total_laureates: row["nb_total_laureates"].to_i,
    visible: true
  )
  chiffres_prix.organization = prix
  chiffres_prix.save
  p chiffres_prix.valid?
  p chiffres_prix.errors.messages
  p "ajout chiffres prix independant: #{prix.titre} ajouté pour #{chiffres_prix.annee}"
end

# ---------------------------------------------------------------------

p "Imports prix associés à des organizations"
filepath = File.join(Rails.root, 'db', 'import_prix_associes_a_org.csv')
CSV.foreach(filepath, headers: :first_row) do |row|
  organization = Organization.find(row["organization_id"].to_i)
  prix = Organization.new(
    name: row["titre"],
    titre: row["titre"],
    organization_type: "Prix",
    page_structure: true,
    visible: true
  )
  prix.organization = organization
  prix.save
  p prix.valid?
  p prix.errors.messages
  p "prix dependant d'organization: #{prix.titre} ajouté pour #{organization.name}"
end

p "Ajout chiffres pour prix associés à des organizations"
filepath = File.join(Rails.root, 'db', 'import_chiffres_prix_associes_a_org.csv')
CSV.foreach(filepath, headers: :first_row) do |row|
  prix = Organization.where(titre: row["titre"], organization_type: "Prix").first
  chiffres_prix = ChiffresOrganization.new(
    annee: row["annee"].to_i,
    nb_femmes_laureates: row["nb_femmes_laureates"].to_i,
    nb_total_laureates: row["nb_total_laureates"].to_i,
    visible: true
  )
  chiffres_prix.organization = prix
  chiffres_prix.save
  p chiffres_prix.valid?
  p chiffres_prix.errors.messages
  p "ajout chiffres prix dependant d'organization: #{prix.titre} ajouté pour #{chiffres_prix.annee}"
end

# ------------------------------------------------------------------------------------

filepath = File.join(Rails.root, 'db', 'export_data_avant_imports.csv')
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
    annee: row["annee"].to_i,
    titre: row["titre"],
    visible: true
  )
  chiffre.organization = organization
  p chiffre.valid?
  p chiffre.errors.messages
  p "chiffre organization pour #{organization.name} ajouté"
  chiffre.save
end
