class Organization < ApplicationRecord
  # validates :organization_type, presence: true
  validates :name, presence: true
  has_one_attached :logo
  validates :nb_women_expos, presence: true
  validates :total_nb_expos, presence: true
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
    if nb_women_dir && total_nb_dir
      self.dir_parity = nb_women_dir.fdiv(total_nb_dir) >= 0.5
    end

    if nb_women_expos && total_nb_expos
      self.expos_parity = nb_women_expos.fdiv(total_nb_expos) * 100
    end

    if dir_parity == nil
      self.score_parity = expos_parity ? 2 : 0
    elsif expos_parity == nil
      self.score_parity = dir_parity ? 2 : 0
    elsif dir_parity && expos_parity
      self.score_parity = 2
    elsif dir_parity || expos_parity
      self.score_parity = 1
    else
      self.score_parity = 0
    end
  end
end
