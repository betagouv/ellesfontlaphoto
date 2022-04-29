class NotationConseilsArticle < ApplicationRecord
  belongs_to :conseils_article

  ANSWERS = ["inutile", "utile"]
  SUGGESTIONS_INUTILES = ["J'ai déjà ces connaissances", "C’est trop complexe", "Cela ne me concerne pas", "Je n’en ai pas l’usage", "C’est de mauvaise qualité"]
  SUGGESTIONS_UTILES = ["J’ai appris des éléments", "C’est explicite", "Je vois que je ne suis pas seule"]
end
