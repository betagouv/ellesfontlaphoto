class ChiffresOrganization < ActiveRecord::Base
  attr_accessor :titre
  belongs_to :organization
  validates :annee, presence: true
  validates :annee, uniqueness: { scope: :organization }

  # before_validation :validates_for_orga
  # Validation de présence des chiffres en fonction du type de l'organisation
  # validates :nb_femmes_directrices, presence: true, if: -> { organization.orga? }
  # validates :nb_total_directeurs, presence: true, if: -> { organization.orga? }
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

  validates :nb_total_exposes_expo_collective, numericality: { greater_than: 0, allow_nil: true }
  validates :nb_total_exposes_expo_mono, numericality: { greater_than: 0, allow_nil: true }
  validates :nb_total_commissaires, numericality: { greater_than: 0, allow_nil: true }
  validates :nb_total_artistes, numericality: { greater_than: 0, allow_nil: true }
  validates :nb_total_oeuvres_photo, numericality: { greater_than: 0, allow_nil: true }
  validates :nb_total_oeuvres_ajoutees, numericality: { greater_than: 0, allow_nil: true }
  validates :nb_total_enseignants, numericality: { greater_than: 0, allow_nil: true }
  validates :nb_total_etudiants, numericality: { greater_than: 0, allow_nil: true }
  validates :nb_total_photographes_etudies, numericality: { greater_than: 0, allow_nil: true }
  validates :nb_total_laureates, numericality: { greater_than: 0, allow_nil: true }
  validates :nb_total_candidats, numericality: { greater_than: 0, allow_nil: true }
  validates :nb_total_jurys, numericality: { greater_than: 0, allow_nil: true }
  validates :nb_total_publies, numericality: { greater_than: 0, allow_nil: true }
  validates :nb_total_iconographes, numericality: { greater_than: 0, allow_nil: true }
  validates :nb_total_accueil_residence, numericality: { greater_than: 0, allow_nil: true }
  validates :nb_total_photo_ouvrages, numericality: { greater_than: 0, allow_nil: true }
  validates :nb_total_photographes_invites, numericality: { greater_than: 0, allow_nil: true }
  # validates :nb_total_directeurs, numericality: { greater_than: 0, allow_nil: true }
  validates :nb_total_employes, numericality: { greater_than: 0, allow_nil: true }

  validates :nb_total_exposes_expo_collective, numericality: { greater_than_or_equal_to: :nb_femmes_exposees_expo_collective }, if: -> { !nb_femmes_exposees_expo_collective.nil? && !nb_total_exposes_expo_collective.nil? }
  validates :nb_total_exposes_expo_mono, numericality: { greater_than_or_equal_to: :nb_femmes_exposees_expo_mono }, if: -> { !nb_total_exposes_expo_mono.nil? && !nb_femmes_exposees_expo_mono.nil? }
  validates :nb_total_commissaires, numericality: { greater_than_or_equal_to: :nb_femmes_commissaires }, if: -> { !nb_total_commissaires.nil? && !nb_femmes_commissaires.nil? }
  validates :nb_total_artistes, numericality: { greater_than_or_equal_to: :nb_femmes_artistes }, if: -> { !nb_total_artistes.nil? && !nb_femmes_artistes.nil? }
  validates :nb_total_oeuvres_photo, numericality: { greater_than_or_equal_to: :nb_total_oeuvres_photo }, if: -> { !nb_total_oeuvres_photo.nil? && !nb_total_oeuvres_photo.nil? }
  validates :nb_total_oeuvres_ajoutees, numericality: { greater_than_or_equal_to: :nb_femmes_oeuvres_ajoutees }, if: -> { !nb_total_oeuvres_ajoutees.nil? && !nb_femmes_oeuvres_ajoutees.nil? }
  validates :nb_total_enseignants, numericality: { greater_than_or_equal_to: :nb_femmes_enseignantes }, if: -> { !nb_total_enseignants.nil? && !nb_femmes_enseignantes.nil? }
  validates :nb_total_etudiants, numericality: { greater_than_or_equal_to: :nb_femmes_etudiantes }, if: -> { !nb_total_etudiants.nil? && !nb_femmes_etudiantes.nil? }
  validates :nb_total_photographes_etudies, numericality: { greater_than_or_equal_to: :nb_femmes_photographes_etudiees }, if: -> { !nb_total_photographes_etudies.nil? && !nb_femmes_photographes_etudiees.nil? }
  validates :nb_total_laureates, numericality: { greater_than_or_equal_to: :nb_femmes_laureates }, if: -> { !nb_total_laureates.nil? && !nb_femmes_laureates.nil? }
  validates :nb_total_candidats, numericality: { greater_than_or_equal_to: :nb_femmes_candidates }, if: -> { !nb_total_candidats.nil? && !nb_femmes_candidates.nil? }
  validates :nb_total_jurys, numericality: { greater_than_or_equal_to: :nb_femmes_jurys }, if: -> { !nb_total_jurys.nil? && !nb_femmes_jurys.nil? }
  validates :nb_total_publies, numericality: { greater_than_or_equal_to: :nb_femmes_publiees }, if: -> { !nb_total_publies.nil? && !nb_femmes_publiees.nil? }
  validates :nb_total_iconographes, numericality: { greater_than_or_equal_to: :nb_femmes_iconographes }, if: -> { !nb_total_iconographes.nil? && !nb_femmes_iconographes.nil? }
  validates :nb_total_accueil_residence, numericality: { greater_than_or_equal_to: :nb_femmes_accueil_residence }, if: -> { !nb_total_accueil_residence.nil? && !nb_femmes_accueil_residence.nil? }
  validates :nb_total_photo_ouvrages, numericality: { greater_than_or_equal_to: :nb_femmes_photo_ouvrages }, if: -> { !nb_total_photo_ouvrages.nil? && !nb_femmes_photo_ouvrages.nil? }
  validates :nb_total_photographes_invites, numericality: { greater_than_or_equal_to: :nb_femmes_photographes_invites }, if: -> { !nb_total_photographes_invites.nil? && !nb_femmes_photographes_invites.nil? }
  # validates :nb_total_directeurs, numericality: { greater_than_or_equal_to: :nb_femmes_directrices }, if: -> { !nb_total_directeurs.nil? && !nb_femmes_directrices.nil? }
  validates :nb_total_employes, numericality: { greater_than_or_equal_to: :nb_femmes_employees }, if: -> { !nb_total_employes.nil? && !nb_femmes_employees.nil? }

  validates :nb_femmes_etudiantes, numericality: { greater_than: 0, allow_nil: true}
  validates :nb_femmes_enseignantes, numericality: { greater_than: 0, allow_nil: true}
  validates :nb_femmes_photographes_etudiees, numericality: { greater_than: 0, allow_nil: true}
  validates :nb_femmes_publiees, numericality: { greater_than: 0, allow_nil: true}
  validates :nb_femmes_iconographes, numericality: { greater_than: 0, allow_nil: true}
  validates :nb_femmes_exposees, numericality: { greater_than: 0, allow_nil: true}
  validates :nb_femmes_exposees_expo_collective, numericality: { greater_than: 0, allow_nil: true}
  validates :nb_femmes_exposees_expo_mono, numericality: { greater_than: 0, allow_nil: true}
  validates :nb_femmes_moins_40, numericality: { greater_than: 0, allow_nil: true}
  validates :nb_femmes_plus_40, numericality: { greater_than: 0, allow_nil: true}
  validates :nb_femmes_post_mortem, numericality: { greater_than: 0, allow_nil: true}
  validates :nb_femmes_commissaires, numericality: { greater_than: 0, allow_nil: true}
  validates :nb_femmes_artistes, numericality: { greater_than: 0, allow_nil: true}
  validates :nb_oeuvres_photo_femmes, numericality: { greater_than: 0, allow_nil: true}
  validates :nb_femmes_oeuvres_ajoutees, numericality: { greater_than: 0, allow_nil: true}
  validates :nb_femmes_candidates, numericality: { greater_than: 0, allow_nil: true}
  validates :nb_femmes_laureates, numericality: { greater_than: 0, allow_nil: true}
  validates :nb_femmes_jurys, numericality: { greater_than: 0, allow_nil: true}
  validates :nb_femmes_accueil_residence, numericality: { greater_than: 0, allow_nil: true}
  validates :nb_femmes_photo_ouvrages, numericality: { greater_than: 0, allow_nil: true}
  validates :nb_femmes_photographes_invites, numericality: { greater_than: 0, allow_nil: true}
  # validates :nb_femmes_directrices, numericality: { greater_than: 0, allow_nil: true}
  validates :nb_femmes_employees, numericality: { greater_than: 0, allow_nil: true}

  def validates_for_orga
    if organization.orga?
      if (nb_total_exposes_expo_collective.nil? || nb_femmes_exposees_expo_collective.nil?) && (nb_total_exposes_expo_mono.nil? || nb_femmes_exposees_expo_mono.nil?)
        errors.add(:orga, 'Vous devez au moins préciser les chiffres de vos expositions monographiques ou de vos expositions collectives')
      end
    end
  end
  # Calcul du score de parité
  def calculate_parity
    if organization.orga?
      self.exposes_expo_collective_parite = calculate(nb_femmes_exposees_expo_collective, nb_total_exposes_expo_collective)
      self.exposes_expo_mono_parite = calculate(nb_femmes_exposees_expo_mono, nb_total_exposes_expo_mono)
      self.commissaires_parite = calculate(nb_femmes_commissaires, nb_total_commissaires)
      self.artistes_parite = calculate(nb_femmes_artistes, nb_total_artistes)
      self.oeuvres_photo_parite = calculate(nb_oeuvres_photo_femmes, nb_total_oeuvres_photo)
      self.oeuvres_ajoutees_parite = calculate(nb_femmes_oeuvres_ajoutees, nb_total_oeuvres_ajoutees)
      self.nb_femmes_exposees = nb_femmes_exposees_expo_mono.to_i + nb_femmes_exposees_expo_collective.to_i
      self.nb_total_exposes = nb_total_exposes_expo_mono.to_i + nb_total_exposes_expo_collective.to_i
      self.exposes_parite = calculate(nb_femmes_exposees, nb_total_exposes)
    elsif organization.ecole?
      self.enseignants_parite = calculate(nb_femmes_enseignantes, nb_total_enseignants)
      self.etudiants_parite = calculate(nb_femmes_etudiantes, nb_total_etudiants)
      self.photographes_etudies_parite = calculate(nb_femmes_photographes_etudiees, nb_total_photographes_etudies)
    elsif organization.prix?
      self.laureates_parite = calculate(nb_femmes_laureates, nb_total_laureates)
      self.candidates_parite = calculate(nb_femmes_candidates, nb_total_candidats)
      self.jurys_parite = calculate(nb_femmes_jurys, nb_total_jurys)
    elsif organization.journal?
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

  def add_error(nb_total, nb_women)
    self.errors.add(nb_total, "Doit être supérieur à #{nb_women}")
  end

  def calculate(nb_women, nb_total)
    if nb_total.to_i && nb_women.to_i
      nb_total.to_i == 0 ? 0 : nb_women.to_i.fdiv(nb_total.to_i) * 100
    else
      0
    end
  end
end
