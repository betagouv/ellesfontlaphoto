class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.order("total_nb_expos DESC NULLS LAST")
    @contact = Contact.new
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
    params.require(:organization).permit(:organization_type, :name, :city, :nb_women_dir, :total_nb_dir, :nb_women_expos, :total_nb_expos)
  end
end
