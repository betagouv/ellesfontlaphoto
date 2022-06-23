class NotationHelp < ApplicationRecord
  belongs_to :help
  SUGGESTIONS_INUTILES = ["L’aide n’est pas ouverte", "Je ne sais pas quoi faire après cette lecture", "C’est trop complexe", "L’aide ne correspond pas à mon profil"]
  SUGGESTIONS_UTILES = ["Je ne connaissais pas cette aide", "Le contenu est explicite", "Je vais candidater", "Je sais qui contacter"]
  ANSWERS = ["yes", "no", "yesbut"]

  def self.pourcentage_notation_help_utile
    (NotationHelp.where(oui: 1).count * 100) / NotationHelp.count
  end

  def self.pourcentage_notation_help_inutile
    (NotationHelp.where(non: 1).count * 100) / NotationHelp.count
  end

  def self.pourcentage_notation_help_utile_mais_fermee
    (NotationHelp.where(oui_mais_fermee: 1).count * 100) / NotationHelp.count
  end
end
