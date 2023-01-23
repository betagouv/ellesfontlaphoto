ActiveAdmin.register CaseReview do
  index do
    column :id
    column "Email Candidate", :candidate_email
    column "Email Évaluatrice", :reviewer_email
    column "Statut", :status
    column "Date d'inscription", :creation_binome do |obj|
      obj.created_at.strftime("%B %d, %Y %H:%M")
    end
    column "Date de Création du binôme", :creation_binome do |obj|
      obj.creation_binome.strftime("%B %d, %Y %H:%M") if obj.creation_binome
    end
    column "Date d'envoi feedback", :date_envoi_feedback do |obj|
      obj.date_envoi_feedback.strftime("%B %d, %Y %H:%M") if obj.date_envoi_feedback
    end
    column "Date de notation commune", :date_notation do |obj|
      obj.date_notation.strftime("%B %d, %Y %H:%M") if obj.date_notation
    end
    actions
  end

  show do
    attributes_table do
      row :id
      row :candidate_email
      row :reviewer_email
      row :status
      row :message
      row :points_forts
      row :points_faibles
      row :autres
      row :valid_cgu
      row "Date d'inscription", :creation_binome do |obj|
        obj.created_at.strftime("%B %d, %Y %H:%M")
      end
      row "Date de Création du binôme", :creation_binome do |obj|
        obj.creation_binome.strftime("%B %d, %Y %H:%M") if obj.creation_binome
      end
      row "Date d'envoi feedback", :date_envoi_feedback do |obj|
        obj.date_envoi_feedback.strftime("%B %d, %Y %H:%M") if obj.date_envoi_feedback
      end
      row "Date de notation commune", :date_notation do |obj|
        obj.date_notation.strftime("%B %d, %Y %H:%M") if obj.date_notation
      end
    end
  end
end
