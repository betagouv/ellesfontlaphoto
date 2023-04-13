class ChiffresOrganization < ActiveRecord::Base
  belongs_to :organization
  validates :annee, presence: true
  validates :annee, uniqueness: { scope: :organization }
  after_validation :calculate_parity
  validates :nb_total_exposes, numericality: { greater_than_or_equal_to: :nb_femmes_exposees }
  validates :nb_total_exposes_expo_collective, numericality: { greater_than_or_equal_to: :nb_femmes_exposees_expo_collective }
  validates :nb_total_exposes_expo_mono, numericality: { greater_than_or_equal_to: :nb_femmes_exposees_expo_mono }
  validates :nb_total_commissaires, numericality: { greater_than_or_equal_to: :nb_femmes_commissaires }
  validates :nb_total_artistes, numericality: { greater_than_or_equal_to: :nb_femmes_artistes }
  validates :nb_total_oeuvres_photo, numericality: { greater_than_or_equal_to: :nb_total_oeuvres_photo }
  validates :nb_total_oeuvres_ajoutees, numericality: { greater_than_or_equal_to: :nb_femmes_oeuvres_ajoutees }
  validates :nb_total_enseignants, numericality: { greater_than_or_equal_to: :nb_femmes_enseignantes }
  validates :nb_total_etudiants, numericality: { greater_than_or_equal_to: :nb_femmes_etudiantes }
  validates :nb_total_photographes_etudies, numericality: { greater_than_or_equal_to: :nb_femmes_photographes_etudiees }
  validates :nb_total_laureates, numericality: { greater_than_or_equal_to: :nb_femmes_laureates }
  validates :nb_total_candidats, numericality: { greater_than_or_equal_to: :nb_femmes_candidates }
  validates :nb_total_jurys, numericality: { greater_than_or_equal_to: :nb_femmes_jurys }
  validates :nb_total_publies, numericality: { greater_than_or_equal_to: :nb_femmes_publiees }
  validates :nb_total_iconographes, numericality: { greater_than_or_equal_to: :nb_femmes_iconographes }
  validates :nb_total_accueil_residence, numericality: { greater_than_or_equal_to: :nb_femmes_accueil_residence }
  validates :nb_total_photo_ouvrages, numericality: { greater_than_or_equal_to: :nb_femmes_photo_ouvrages }
  validates :nb_total_photographes_invites, numericality: { greater_than_or_equal_to: :nb_femmes_photographes_invites }
  validates :nb_total_directeurs, numericality: { greater_than_or_equal_to: :nb_femmes_directrices }
  validates :nb_total_employes, numericality: { greater_than_or_equal_to: :nb_femmes_employees }

  def calculate_parity
    if self.organization.organization_type == "Espace d'exposition" || self.organization.organization_type == "Festival"
      self.exposes_parite = calculate(nb_femmes_exposees, nb_total_exposes)
      self.exposes_expo_collective_parite = calculate(nb_femmes_exposees_expo_collective, nb_total_exposes_expo_collective)
      self.exposes_expo_mono_parite = calculate(nb_femmes_exposees_expo_mono, nb_total_exposes_expo_mono)
      self.commissaires_parite = calculate(nb_femmes_commissaires, nb_total_commissaires)
      self.artistes_parite = calculate(nb_femmes_artistes, nb_total_artistes)
      self.oeuvres_photo_parite = calculate(nb_oeuvres_photo_femmes, nb_total_oeuvres_photo)
      self.oeuvres_ajoutees_parite = calculate(nb_femmes_oeuvres_ajoutees, nb_total_oeuvres_ajoutees)
    elsif self.organization.organization_type == "École"
      self.enseignants_parite = calculate(nb_femmes_enseignantes, nb_total_enseignants)
      self.etudiants_parite = calculate(nb_femmes_etudiantes, nb_total_etudiants)
      self.photographes_etudies_parite = calculate(nb_femmes_photographes_etudiees, nb_total_photographes_etudies)
    elsif self.organization.organization_type == "Prix"
      self.laureates_parite = calculate(nb_femmes_laureates, nb_total_laureates)
      self.candidates_parite = calculate(nb_femmes_candidates, nb_total_candidats)
      self.jurys_parite = calculate(nb_femmes_jurys, nb_total_jurys)
    elsif self.organization.organization_type == "Journal/Magazine"
      self.publies_parite = calculate(nb_femmes_publiees, nb_total_publies)
      self.iconographes_parite = calculate(nb_femmes_iconographes, nb_total_iconographes)
    end
    self.accueil_residence_parite = calculate(nb_femmes_accueil_residence, nb_total_accueil_residence)
    self.photo_ouvrages_parite = calculate(nb_femmes_photo_ouvrages, nb_total_photo_ouvrages)
    self.photographes_invites_parite = calculate(nb_femmes_photographes_invites, nb_total_photographes_invites)
    self.directeurs_parite = calculate(nb_femmes_directrices, nb_total_directeurs)
    self.employes_parite = calculate(nb_femmes_employees, nb_total_employes)
  end

  private

  def calculate(nb_women, nb_total)
    if nb_women && nb_total
      nb_women.fdiv(nb_total) * 100
    end
  end
end
