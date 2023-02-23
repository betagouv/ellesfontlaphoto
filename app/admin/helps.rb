ActiveAdmin.register Help do
  permit_params :title, :description, :sector, :institution_name, :type_list, :help_amount, :description_longue, :residence_condition, :general_condition, :specific_condition, :candidate_url, :institution_url, :selection, :compo_commission, :url_commission, :old_laureat, :old_laureat_url, :admin_attachment, :artistic_attachment, :other_attachment, :contact_institution, :contact_institution_url, :example_enrollment_url, :faq_url, :issue_contact, :statistic, :permanent, :end_date, :start_date, :identifiant, :institution_partenaire, :regularity, :description_url, :residence_time, :help_advantage, :old_laureats_case_url, :parentality, :accessibility, :contact_intitution_email, :contact_intitution_partenaire, :commission_parite, :old_laureats_parite, :visible, candidature_dates_attributes: [:id, :start_date, :end_date, :_destroy]

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
      HelpMailer.online_help(help).deliver_later
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
  end

  before_update do |help|
    help.type_list = params["help"]["type_list"]
  end

  show do
    attributes_table do
      row :id
      row :visible
      row :title
      row :type_list
      row :description
      row :help_amount
      row :general_condition
      row :residence_condition
      row :permanent, "Permanent"
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
      row :description_longue
      row :candidate_url
      row :admin_attachment
      row :selection
      row :specific_condition
      row :compo_commission
      row :commission_parite
      row :old_laureat
      row :old_laureats_parite
      row :institution_name
      row :institution_url
      row :contact_institution
      row :contact_intitution_email
      row :faq_url
      row :accept_cgu
      row :author_email
      row :created_at
      row :updated_at
    end
  end

  filter :title
  filter :type_list
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
    column :type_list
    column :general_condition
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
      f.input :title
      f.input :type_list, :as => :check_boxes, :collection => Help::HELP_TYPE
      f.input :description
      f.input :help_amount, as: :quill_editor
      f.input :general_condition, as: :quill_editor
      f.input :residence_condition, as: :select, collection: Help::HELP_RESIDENCE, label: "Conditions de résidence"
    end
    f.inputs "Date de candidatures" do
      f.input :permanent, label: "Cochez cette case si le dépôt de candidatures est possible toute l'année"
      f.has_many :candidature_dates, heading: "Date de candidatures", new_record: "Ajouter des dates de candidatures", allow_destroy: true do |a|
        a.inputs do
          a.input :start_date, as: :date_picker, input_html: {style: "width:20%"}, label: "Date de début de candidature"
          a.input :end_date, as: :date_picker, input_html: {style: "width:20%"}, label: "Date de fin de candidature"
        end
      end
    end
    f.inputs "Description longue" do
      f.input :description_longue, as: :quill_editor, label: "Description Longue - optionnel"
    end
    f.inputs "Candidatez" do
      f.input :candidate_url
    end
    f.inputs "Pièces à fournir" do
      f.input :admin_attachment, as: :quill_editor
    end
    f.inputs "Sélection" do
      f.input :selection, as: :quill_editor
      f.input :specific_condition, as: :quill_editor
      f.input :compo_commission, as: :quill_editor
      f.input :commission_parite, as: :select, collection: Help::PARITE
      f.input :old_laureat, as: :quill_editor
      f.input :old_laureats_parite, as: :select, collection: Help::PARITE
    end
    f.inputs "Contact" do
      f.input :institution_name
      f.input :institution_url
      f.input :contact_institution, as: :quill_editor
      f.input :contact_intitution_email, as: :quill_editor
      f.input :faq_url
      f.input :author_email, label: "Email de l'auteur (Si l'aide est proposée)"
    end
    f.inputs "A SUPPRIMER" do
      f.input :sector
      f.input :description_url, label: "Url de description"
      f.input :url_commission
      f.input :old_laureat_url, label: "Anciens lauréates url"
      f.input :residence_time, label: "Temps de résidence"
      f.input :artistic_attachment, as: :quill_editor, label: "Pièces jointes artistiques"
      f.input :help_advantage, label: "Avantage de l'aide"
      f.input :other_attachment, as: :quill_editor, label: "Autres pièces jointes"
      f.input :old_laureats_case_url, label: "Anciens lauréates cas url"
      f.input :contact_intitution_partenaire, as: :quill_editor, label: "Contact institution partenaires"
      f.input :parentality, label: "Parentalité"
      f.input :accessibility, label: "Accéssibilité"
      f.input :regularity, label: "Régularité"
      f.input :institution_partenaire, as: :quill_editor, label: "Institution partenaires"
      f.input :statistic, as: :quill_editor, label: "Statistiques"
      f.input :example_enrollment_url, label: "Exemple d'inscription"
      f.input :issue_contact, label: "Contact problèmes"
    end
    f.actions
  end

  csv do
    column :visible
    column :title
    column(:type_list) { |help| help.type_list.map { |e| e } }
    column :description
    column :help_amount
    column :general_condition
    column :residence_condition
    column :permanent
    column(:start_date) { |help| help.candidature_dates.map { |c| c.start_date } }
    column(:end_date) { |help| help.candidature_dates.map { |c| c.end_date } }
    column :description_longue
    column :candidate_url
    column :admin_attachment
    column :selection
    column :specific_condition
    column :compo_commission
    column :commission_parite
    column :old_laureat
    column :old_laureats_parite
    column :institution_name
    column :institution_url
    column :contact_institution
    column :contact_intitution_email
    column :faq_url
    column :accept_cgu
    column :author_email
    column :created_at
    column :updated_at
  end
end
