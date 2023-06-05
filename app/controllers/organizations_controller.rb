class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:edit, :show, :update, :renseigner_prix, :create_prix]
  def index
    @contact = Contact.new
    @organizations = Organization.all
    if params[:query].present? && !params[:query].empty?
      @searched_name = params[:query]
      sql_query = "name ILIKE :query OR city ILIKE :query"
      @organizations = Organization.where(sql_query, query: "%#{params[:query]}%").order("name")
    end
    if params[:type].present? && params[:type].split(",").length != 0
      @selected_type = params[:type].split(",")
      @organizations = @organizations.where(organization_type: params[:type].split(",")).order("name")
    end
    unless (params[:type].present? && params[:type].split(",").length != 0) && params[:query].present?
      @selected_type = ""
      @organizations = @organizations.where(visible: true).order("name")
    end
    if @organizations.empty?
      respond_to do |format|
        format.html
        format.text { render partial: "no_result", locals: { query: params[:query]}, formats: [:html] }
      end
    else
      respond_to do |format|
        format.html
        format.text { render partial: "list", locals: { organizations: @organizations}, formats: [:html] }
      end
    end
  end

  def renseigner_index
  end

  def show
    @chiffres_organization = ChiffresOrganization.where(organization: @organization, visible: true)
    @prix = Organization.where(organization_type: "Prix", organization: @organization)
  end

  def new
    @organization = Organization.new
    @chiffres_organization = ChiffresOrganization.new
  end

  def edit
    @chiffres_organization = ChiffresOrganization.new
  end

  def update
    @chiffres_organization = ChiffresOrganization.new
    if @organization.update(organization_params)
      redirect_to new_organization_chiffres_organization_path(@organization, @chiffres_organization)
    else
      render :edit
    end
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.visible = false
    if @organization.save
      redirect_to new_organization_chiffres_organization_path(@organization)
    else
      render :new
    end
  end

  def renseigner_prix
    @prix_organization = Organization.new
    @prix_organization.chiffres_organizations.build
  end

  def create_prix
    @prix_organization = new_price(@organization)
    @chiffres_prix = ChiffresOrganization.new(organization_avec_prix_params[:chiffres_organizations_attributes]["0"])
    @chiffres_prix.organization = @prix_organization
    if @chiffres_prix.valid? && @prix_organization.valid?
      @chiffres_prix.save
      @prix_organization.save
      redirect_to confirm_organization_path
    else
      @prix_organization.chiffres_organizations.build
      @prix_organization.valid?
      render action: "renseigner_prix"
    end
  end

  private

  def new_price(organization)
    Organization.new(
      organization_type: "Prix",
      name: organization.name,
      city: organization.city,
      titre: organization_avec_prix_params[:titre],
      email: organization.email,
      visible: false,
      organization: organization,
      finance_ministre: organization.finance_ministre
    )
  end

  def organization_params
    params.require(:organization).permit(:organization_type, :name, :city, :email, :finance_ministre, :titre, :website, :reseau)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_avec_prix_params
    params.require(:organization).permit(:titre, chiffres_organizations_attributes:[:annee, :nb_total_candidats, :nb_femmes_candidates, :nb_total_laureates, :nb_femmes_laureates, :nb_total_jurys, :nb_femmes_jurys])
  end
end
