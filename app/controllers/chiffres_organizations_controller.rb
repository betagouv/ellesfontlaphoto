class ChiffresOrganizationsController < ApplicationController
  before_action :set_organization, only: [:new]
  def new
    @chiffres_organization = ChiffresOrganization.new
  end

  def create
    raise
  end

  private

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end
end
