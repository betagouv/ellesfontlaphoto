class OrganizationsController < ApplicationController
  def index
    @contact = Contact.new
    if params[:query].present?
      @searched = true
      sql_query = "name ILIKE :query OR city ILIKE :query"
      @organizations = Organization.where(sql_query, query: "%#{params[:query]}%").order("name")
    else
      @searched = false
      @organizations = Organization.where(visible: true).order("name")
    end
    if @organizations.empty?
      respond_to do |format|
        format.html
        format.text { render partial: "no_result", locals: {query: params[:query]}, formats: [:html] }
      end
    else
      respond_to do |format|
        format.html
        format.text { render partial: "card_organization", locals: {organizations: @organizations}, formats: [:html] }
      end
    end
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.visible = false
    @organization.save
  end

  def add_request_info
    if params[:id]
      @organization = Organization.find(params[:id])
      @organization.request_info_count += 1
      @organization.save
    end
    respond_to do |format|
      format.html { render redirect_to organizations_path }
      format.text { render partial: 'organizations/info_orga_validate', formats: [:html] }
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:organization_type, :name, :city, :nb_women_dir, :total_nb_dir, :nb_women_expos, :total_nb_expos)
  end
end
