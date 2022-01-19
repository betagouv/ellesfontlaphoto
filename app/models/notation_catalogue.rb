class NotationCatalogue < ApplicationRecord

  def self.pourcentage_notation_help_utile
    nb_total_notation = NotationCatalogue.where(catalogue: "Aides").first.inutile + NotationCatalogue.where(catalogue: "Aides").first.utile + NotationCatalogue.where(catalogue: "Aides").first.utile_mais_fermee
    return NotationCatalogue.where(catalogue: "Aides").first.utile * 100 / nb_total_notation
  end

  def self.pourcentage_notation_help_inutile
    nb_total_notation = NotationCatalogue.where(catalogue: "Aides").first.inutile + NotationCatalogue.where(catalogue: "Aides").first.utile + NotationCatalogue.where(catalogue: "Aides").first.utile_mais_fermee
    return NotationCatalogue.where(catalogue: "Aides").first.inutile * 100 / nb_total_notation
  end

  def self.pourcentage_notation_help_utile_mais_fermee
    nb_total_notation = NotationCatalogue.where(catalogue: "Aides").first.inutile + NotationCatalogue.where(catalogue: "Aides").first.utile + NotationCatalogue.where(catalogue: "Aides").first.utile_mais_fermee
    return NotationCatalogue.where(catalogue: "Aides").first.utile_mais_fermee * 100 / nb_total_notation
  end

  def self.pourcentage_notation_conseil_utile
    nb_total_notation = NotationCatalogue.where(catalogue: "Conseils").first.inutile + NotationCatalogue.where(catalogue: "Conseils").first.utile + NotationCatalogue.where(catalogue: "Conseils").first.utile_mais_fermee
    return NotationCatalogue.where(catalogue: "Conseils").first.utile * 100 / nb_total_notation
  end

  def self.pourcentage_notation_conseil_inutile
    nb_total_notation = NotationCatalogue.where(catalogue: "Conseils").first.inutile + NotationCatalogue.where(catalogue: "Conseils").first.utile + NotationCatalogue.where(catalogue: "Conseils").first.utile_mais_fermee
    return NotationCatalogue.where(catalogue: "Conseils").first.inutile * 100 / nb_total_notation
  end

end
