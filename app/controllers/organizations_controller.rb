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

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.visible = false
    @organization.save
  end

  private

  def organization_params
    params.require(:organization).permit(:organization_type, :name, :city)
  end
end
