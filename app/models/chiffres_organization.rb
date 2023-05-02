class ChiffresOrganization < ActiveRecord::Base
  attr_accessor :titre
  belongs_to :organization
  validates :annee, presence: true
  validates :annee, uniqueness: { scope: :organization }

  # Validation de présence des chiffres en fonction du type de l'organisation
  validates :nb_femmes_directrices, presence: true, if: -> { organization.orga? }
  validates :nb_total_directeurs, presence: true, if: -> { organization.orga? }
  validates :nb_femmes_enseignantes, presence: true, if: -> { organization.ecole? }
  validates :nb_total_enseignants, presence: true, if: -> { organization.ecole? }
  validates :nb_femmes_etudiantes, presence: true, if: -> { organization.ecole? }
  validates :nb_total_etudiants, presence: true, if: -> { organization.ecole? }
  validates :nb_femmes_laureates, presence: true, if: -> { organization.prix? }
  validates :nb_total_laureates, presence: true, if: -> { organization.prix? }
  validates :nb_femmes_candidates, presence: true, if: -> { organization.prix? }
  validates :nb_total_candidats, presence: true, if: -> { organization.prix? }
  validates :nb_femmes_publiees, presence: true, if: -> { organization.journal? }
  validates :nb_total_publies, presence: true, if: -> { organization.journal? }
  validates :nb_femmes_iconographes, presence: true, if: -> { organization.journal? }
  validates :nb_total_iconographes, presence: true, if: -> { organization.journal? }

  # Validations de calcul de parité
  after_validation :calculate_parity
  validates :nb_total_exposes_expo_collective, numericality: { greater_than_or_equal_to: :nb_femmes_exposees_expo_collective, only_integer: true, allow_nil: true }
  validates :nb_total_exposes_expo_mono, numericality: { greater_than_or_equal_to: :nb_femmes_exposees_expo_mono, only_integer: true, allow_nil: true }
  validates :nb_total_commissaires, numericality: { greater_than_or_equal_to: :nb_femmes_commissaires, only_integer: true, allow_nil: true }
  validates :nb_total_artistes, numericality: { greater_than_or_equal_to: :nb_femmes_artistes, only_integer: true, allow_nil: true }
  validates :nb_total_oeuvres_photo, numericality: { greater_than_or_equal_to: :nb_total_oeuvres_photo, only_integer: true, allow_nil: true }
  validates :nb_total_oeuvres_ajoutees, numericality: { greater_than_or_equal_to: :nb_femmes_oeuvres_ajoutees, only_integer: true, allow_nil: true }
  validates :nb_total_enseignants, numericality: { greater_than_or_equal_to: :nb_femmes_enseignantes, only_integer: true, allow_nil: true }
  validates :nb_total_etudiants, numericality: { greater_than_or_equal_to: :nb_femmes_etudiantes, only_integer: true, allow_nil: true }
  validates :nb_total_photographes_etudies, numericality: { greater_than_or_equal_to: :nb_femmes_photographes_etudiees, only_integer: true, allow_nil: true }
  validates :nb_total_laureates, numericality: { greater_than_or_equal_to: :nb_femmes_laureates, only_integer: true, allow_nil: true }
  validates :nb_total_candidats, numericality: { greater_than_or_equal_to: :nb_femmes_candidates, only_integer: true, allow_nil: true }
  validates :nb_total_jurys, numericality: { greater_than_or_equal_to: :nb_femmes_jurys, only_integer: true, allow_nil: true }
  validates :nb_total_publies, numericality: { greater_than_or_equal_to: :nb_femmes_publiees, only_integer: true, allow_nil: true }
  validates :nb_total_iconographes, numericality: { greater_than_or_equal_to: :nb_femmes_iconographes, only_integer: true, allow_nil: true }
  validates :nb_total_accueil_residence, numericality: { greater_than_or_equal_to: :nb_femmes_accueil_residence, only_integer: true, allow_nil: true }
  validates :nb_total_photo_ouvrages, numericality: { greater_than_or_equal_to: :nb_femmes_photo_ouvrages, only_integer: true, allow_nil: true }
  validates :nb_total_photographes_invites, numericality: { greater_than_or_equal_to: :nb_femmes_photographes_invites, only_integer: true, allow_nil: true }
  validates :nb_total_directeurs, numericality: { greater_than_or_equal_to: :nb_femmes_directrices, only_integer: true, allow_nil: true }
  validates :nb_total_employes, numericality: { greater_than_or_equal_to: :nb_femmes_employees, only_integer: true, allow_nil: true }

  # Calcul du score de parité
  def calculate_parity
    case organization.organization_type
    when "Espace d'exposition" || 'Festival'
      self.exposes_expo_collective_parite = calculate(nb_femmes_exposees_expo_collective, nb_total_exposes_expo_collective)
      self.exposes_expo_mono_parite = calculate(nb_femmes_exposees_expo_mono, nb_total_exposes_expo_mono)
      self.commissaires_parite = calculate(nb_femmes_commissaires, nb_total_commissaires)
      self.artistes_parite = calculate(nb_femmes_artistes, nb_total_artistes)
      self.oeuvres_photo_parite = calculate(nb_oeuvres_photo_femmes, nb_total_oeuvres_photo)
      self.oeuvres_ajoutees_parite = calculate(nb_femmes_oeuvres_ajoutees, nb_total_oeuvres_ajoutees)
      self.nb_femmes_exposees = nb_femmes_exposees_expo_mono.to_i + nb_femmes_exposees_expo_collective.to_i
      self.nb_total_exposes = nb_total_exposes_expo_mono.to_i + nb_total_exposes_expo_collective.to_i
      self.exposes_parite = calculate(nb_femmes_exposees, nb_total_exposes)
    when 'École'
      self.enseignants_parite = calculate(nb_femmes_enseignantes, nb_total_enseignants)
      self.etudiants_parite = calculate(nb_femmes_etudiantes, nb_total_etudiants)
      self.photographes_etudies_parite = calculate(nb_femmes_photographes_etudiees, nb_total_photographes_etudies)
    when 'Prix'
      self.laureates_parite = calculate(nb_femmes_laureates, nb_total_laureates)
      self.candidates_parite = calculate(nb_femmes_candidates, nb_total_candidats)
      self.jurys_parite = calculate(nb_femmes_jurys, nb_total_jurys)
    when 'Journal/Magazine'
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
    raise
    if nb_total.to_i && nb_women.to_i
      nb_total.to_i == 0 ? 0 : nb_women.to_i.fdiv(nb_total.to_i) * 100
    else
      0
    end
  end
end
