class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.order("total_nb_expos DESC NULLS LAST")
  end
end
