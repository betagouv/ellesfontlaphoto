class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.order("total_nb_expos DESC NULLS LAST")
  end

  def new
    @organization = Organization.new
  end

  def create
    raise
  end

  private

  def organization_params
    params.permit(:organization).require(:organization_type, :name, :city, :nb_women_dir, :total_nb_dir, :nb_women_expos, :total_nb_expos)
  end
end
