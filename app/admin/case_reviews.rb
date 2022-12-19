ActiveAdmin.register CaseReview do
  index do
    column :id
    column "Email Candidate", :candidate_email
    column "Email Évaluatrice", :reviewer_email
    column "Statut", :status
    column :points_forts
    column :points_faibles
    column "Date d'inscription'", :creation_binome do |obj|
      obj.created_at.localtime.strftime("%B %d, %Y %H:%M")
    end
    column "Date de Création du binôme", :creation_binome do |obj|
      obj.creation_binome.localtime.strftime("%B %d, %Y %H:%M")
    end
    column "Date d'envoi feedback", :date_envoi_feedback do |obj|
      obj.date_envoi_feedback.localtime.strftime("%B %d, %Y %H:%M")
    end
    column "Date de notation commune", :date_notation do |obj|
      obj.date_notation.localtime.strftime("%B %d, %Y %H:%M")
    end
    actions
  end

end
