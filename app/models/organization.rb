class Organization < ApplicationRecord
  validates :organization_type, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true

  after_validation :calculate_parity

  ORGANIZATION_TYPE = [
    "Structure",
    "Festival",
    "École",
    "Prix",
    "Journal/Magazine"
  ]

  def calculate_parity
    if organization_type == "Structure" || organization_type == "Festival"
      self.dir_parity = calculate(nb_women_dir, total_nb_dir)
      self.expos_parity = calculate(nb_women_expos, total_nb_expos)
      self.score_parity = calculate_score_parity(dir_parity, expos_parity)
    elsif organization_type == "École"
      self.enseignants_parity = calculate(nb_femmes_enseignantes, nb_total_enseignants)
      self.etudiants_parity = calculate(nb_femmes_etudiantes, nb_total_etudiants)
      self.score_parity = calculate_score_parity(enseignants_parity, etudiants_parity)
    elsif organization_type == "Prix"
      self.laureates_parity = calculate(nb_femmes_laureates, nb_total_laureates)
      self.candidates_parity = calculate(nb_femmes_candidates, nb_total_candidats)
      self.score_parity = calculate_score_parity(laureates_parity, candidates_parity)
    elsif organization_type == "Journal/Magazine"
      self.publies_parity = calculate(nb_femmes_publiees, nb_total_publies)
      self.iconographes_parity = calculate(nb_femmes_iconographes, nb_total_iconographes)
      self.score_parity = calculate_score_parity(publies_parity, iconographes_parity)
    end
  end

  private

  def calculate(nb_women, nb_total)
    if nb_women && nb_total
      nb_women.fdiv(nb_total) * 100
    end
  end

  def calculate_score_parity(parity, parity2)
    if parity.nil?
      parity2 ? 2 : 0
    elsif parity2.nil?
      parity ? 2 : 0
    elsif parity && parity2
      2
    elsif parity || parity2
      1
    else
      0
    end
  end
end
