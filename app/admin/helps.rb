ActiveAdmin.register Help do
  permit_params :title, :description, :sector, :institution_name, :type_list, :type_photo_list, :help_amount, :description_longue, :residence_condition, :general_condition, :specific_condition, :candidate_url, :institution_url, :selection, :compo_commission, :url_commission, :old_laureat, :old_laureat_url, :admin_attachment, :artistic_attachment, :other_attachment, :contact_institution, :contact_institution_url, :example_enrollment_url, :faq_url, :issue_contact, :statistic, :permanent, :end_date, :start_date, :identifiant, :institution_partenaire, :regularity, :description_url, :residence_time, :help_advantage, :old_laureats_case_url, :parentality, :accessibility, :contact_intitution_email, :contact_intitution_partenaire, :commission_parite, :old_laureats_parite, :visible, candidature_dates_attributes: [:id, :start_date, :end_date, :_destroy]

  after_create do |help|
    next_date = help.candidature_dates.where("end_date >= ?", Date.today).order("end_date ASC").first
    if help.permanent?
      help.update(start_date: Date.today + 31, end_date: Date.today + 31)
    elsif next_date.nil?
      help.update(start_date: nil, end_date: nil)
    else
      help.update(start_date: next_date.start_date, end_date: next_date.end_date)
    end
  end

  before_update do |help|
    if params[:help][:visible] == "1" && params[:help][:author_email] != ""
      HelpMailer.online_help(help).deliver_now
    end
  end

  after_update do |help|
    next_date = help.candidature_dates.where("end_date >= ?", Date.today).order("end_date ASC").first
    if help.permanent?
      help.update(start_date: Date.today, end_date: Date.today)
    elsif next_date.nil?
      help.update(start_date: nil, end_date: nil)
    else
      help.update(start_date: next_date.start_date, end_date: next_date.end_date)
    end
  end

  before_create do |help|
    help.type_list = params["help"]["type_list"]
    help.type_photo_list = params["help"]["type_photo_list"]
  end

  before_update do |help|
    help.type_list = params["help"]["type_list"]
    help.type_photo_list = params["help"]["type_photo_list"]
  end

  show do
    attributes_table do
      row :id
      row :visible
      row :title
      row :description
      panel "dates de candidatures" do
        table_for help.candidature_dates do
          column "dates début" do |date|
            date.start_date
          end
          column "dates fin" do |date|
            date.end_date
          end
        end
      end
      row :sector
      row :type_list
      row :type_photo_list
      row :institution_name
      row :permanent
      row :help_amount
      row :residence_condition
      row :general_condition
      row :specific_condition
      row :description_longue
      row :candidate_url
      row :institution_url
      row :selection
      row :compo_commission
      row :url_commission
      row :commission_parite
      row :old_laureat
      row :old_laureat_url
      row :old_laureats_parite
      row :admin_attachment
      row :artistic_attachment
      row :other_attachment
      row :contact_institution
      row :contact_institution_url
      row :contact_intitution_email
      row :contact_intitution_partenaire
      row :example_enrollment_url
      row :faq_url
      row :issue_contact
      row :statistic
      row :identifiant
      row :institution_partenaire
      row :regularity
      row :description_url
      row :residence_time
      row :help_advantage
      row :old_laureats_case_url
      row :parentality
      row :accessibility
      row :author_email
      row :created_at
      row :updated_at
    end
  end

  filter :type_list
  filter :type_photo_list
  filter :title
  filter :sector
  filter :objectif
  filter :institution_name

  controller do
    def scoped_collection
      super.includes :notation_help # prevents N+1 queries to your database
    end
  end

  index do
    column :id
    column :from_api
    column :visible
    column :title
    column :residence_condition
    column :sector
    column :type_list
    column :type_photo
    column :utile, sortable: 'notation_help.oui' do |help|
      if NotationHelp.find_by(help: help)
        NotationHelp.find_by(help: help).oui
      else
        0
      end
    end
    column :inutile, sortable: 'notation_help.non' do |help|
      if NotationHelp.find_by(help: help)
        NotationHelp.find_by(help: help).non
      else
        0
      end
    end
    column :utile_mais_fermee, sortable: 'notation_help.oui_mais_fermee' do |help|
      if NotationHelp.find_by(help: help)
        NotationHelp.find_by(help: help).oui_mais_fermee
      else
        0
      end
    end
    column :created_at
    actions
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs "Bandeau" do
      f.input :visible, as: :boolean, label: "Vibilité"
      f.input :title, label: "Titre"
      f.input :type_list, :as => :check_boxes, :collection => Help::HELP_TYPE, label: "Type"
      f.input :type_photo_list, :as => :check_boxes, :collection => Help::PHOTO_TYPE, label: "Type de photo"
      f.input :description, label: "Description"
      f.input :description_url, label: "Url de description"
      f.input :permanent
      f.input :regularity, label: "Régularité"
      f.has_many :candidature_dates, allow_destroy: true do |a|
        a.inputs do
          a.input :start_date, as: :date_picker, input_html: {style: "width:20%"}, label: "Date de début de candidature"
          a.input :end_date, as: :date_picker, input_html: {style: "width:20%"}, label: "Date de fin de candidature"
        end
      end
      f.input :sector, label: "Sécteur"
      f.input :help_amount, as: :quill_editor, label: "Montant de l'aide"
      f.input :help_advantage, label: "Avantage de l'aide"
      f.input :residence_time, label: "Temps de résidence"
      f.input :residence_condition, as: :select, collection: Help::HELP_RESIDENCE, label: "Conditions de résidence"
      f.input :general_condition, as: :quill_editor, label: "Conditions générales"
    end
    f.inputs "Candidatez" do
      f.input :candidate_url, label: "Url de candidature"
    end

    f.inputs "Description Longue" do
      f.input :description_longue, as: :quill_editor, label: "Description Longue"
    end

    f.inputs "Selection" do
      f.input :selection, as: :quill_editor, label: "Sélection"
      f.input :example_enrollment_url, label: "Exemple d'inscription"
      f.input :compo_commission, as: :quill_editor, label: "Composition de la commission"
      f.input :url_commission, label: "URL de la commission"
      f.input :commission_parite, as: :select, collection: Help::PARITE, label: "Parité de la commission"
      f.input :old_laureat, as: :quill_editor, label: "Anciens lauréates"
      f.input :old_laureat_url, label: "Anciens lauréates url"
      f.input :old_laureats_case_url, label: "Anciens lauréates cas url"
      f.input :old_laureats_parite, as: :select, collection: Help::PARITE, label: "Anciens lauréates parité"
      f.input :statistic, as: :quill_editor, label: "Statistiques"
    end
    f.inputs "Pièces à fournir" do
      f.input :admin_attachment, as: :quill_editor, label: "Pièces jointes administratives"
      f.input :artistic_attachment, as: :quill_editor, label: "Pièces jointes artistiques"
      f.input :other_attachment, as: :quill_editor, label: "Autres pièces jointes"
      f.input :specific_condition, as: :quill_editor, label: "Conditions spécifiques"
      f.input :parentality, label: "Parentalité"
      f.input :accessibility, label: "Accéssibilité"
    end
    f.inputs "Contact" do
      f.input :institution_name, label: "Nom de l'institution"
      f.input :institution_url, label: "URL de l'institution"
      f.input :institution_partenaire, as: :quill_editor, label: "Institution partenaires"
      f.input :contact_institution, as: :quill_editor, label: "Contact institution"
      f.input :contact_intitution_email, as: :quill_editor, label: "Email contact institution"
      f.input :contact_intitution_partenaire, as: :quill_editor, label: "Contact institution partenaires"
      f.input :issue_contact, label: "Contact problèmes"
      f.input :faq_url, label: "FAQ url"
      f.input :author_email, label: "Email de l'auteur (Si l'aide est proposée)"
    end
    f.actions
  end

  csv do
    column :title
    column :description
    column :sector
    column(:type_list) { |help| help.type_list.map { |e| e } }
    column(:type_photo) { |help| help.type_photo.map { |e| e.name } }
    column :institution_name
    column(:start_date) { |help| help.candidature_dates.map { |c| c.start_date } }
    column(:end_date) { |help| help.candidature_dates.map { |c| c.end_date } }
    column :help_amount
    column :residence_condition
    column :general_condition
    column :specific_condition
    column :candidate_url
    column :institution_url
    column :selection
    column :compo_commission
    column :url_commission
    column :old_laureat
    column :old_laureat_url
    column :admin_attachment
    column :artistic_attachment
    column :other_attachment
    column :contact_institution
    column :contact_institution_url
    column :created_at
    column :updated_at
    column :example_enrollment_url
    column :faq_url
    column :issue_contact
    column :statistic
    column :end_date
    column :start_date
    column :identifiant
    column :institution_partenaire
    column :regularity
    column :description_url
    column :residence_time
    column :help_advantage
    column :old_laureats_case_url
    column :parentality
    column :accessibility
    column :contact_intitution_email
    column :contact_intitution_partenaire
    column :commission_parite
    column :old_laureats_parite
    column :visible
    column :description_longue
    column :permanent
    column :open
  end

end
