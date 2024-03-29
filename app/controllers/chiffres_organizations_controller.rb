class ChiffresOrganizationsController < ApplicationController
  before_action :set_organization, only: [:new, :create, :edit, :update]
  before_action :set_chiffre_organization, only: [:edit, :update]

  def new
    @chiffres_organization = ChiffresOrganization.new
    @chiffres_prix = ChiffresOrganization.new
  end


  def create
    @chiffres_organization = ChiffresOrganization.new(chiffres_organization_params)
    @chiffres_organization.organization = @organization
    if @chiffres_organization.save
      if params[:champs_prix] == "true"
        redirect_to renseigner_prix_path(@organization)
      else
        redirect_to confirm_organization_path
      end
    else
      render :new
    end
  end

  def edit
    @chiffres_organization = ChiffresOrganization.find(74)
  end

  def update
    if @chiffres_organization.update(chiffres_organization_params)
      redirect_to renseigner_prix_path(@organization)
    else
      render :edit
    end
  end

  private

  def set_chiffre_organization
    @chiffres_organization = ChiffresOrganization.find(params[:id])
  end

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end

  def chiffres_organization_params
    params.require(:chiffres_organization).permit(:annee, :nb_femmes_etudiantes, :nb_total_etudiants, :etudiants_parite, :nb_femmes_enseignantes, :nb_total_enseignants, :enseignants_parite, :nb_femmes_photographes_etudiees, :nb_total_photographes_etudies, :photographes_etudies_parite, :nb_femmes_publiees, :nb_total_publies, :publies_parite, :nb_femmes_iconographes, :nb_total_iconographes, :iconographes_parite, :nb_femmes_exposees, :nb_total_exposes, :exposes_parite, :nb_femmes_exposees_expo_collective, :nb_total_exposes_expo_collective, :exposes_expo_collective_parite, :nb_femmes_exposees_expo_mono, :nb_total_exposes_expo_mono, :exposes_expo_mono_parite, :nb_femmes_moins_40, :nb_femmes_plus_40, :nb_femmes_post_mortem, :nb_femmes_commissaires, :nb_total_commissaires, :commissaires_parite, :nb_femmes_artistes, :nb_total_artistes, :artistes_parite, :nb_oeuvres_photo_femmes, :nb_total_oeuvres_photo, :oeuvres_photo_parite, :nb_femmes_oeuvres_ajoutees, :nb_total_oeuvres_ajoutees, :oeuvres_ajoutees_parite, :nb_femmes_accueil_residence, :nb_total_accueil_residence, :accueil_residence_parite, :nb_femmes_photo_ouvrages, :nb_total_photo_ouvrages, :photo_ouvrages_parite, :nb_femmes_photographes_invites, :nb_total_photographes_invites, :photographes_invites_parite, :nb_femmes_directrices, :nb_total_directeurs, :directeurs_parite, :nb_femmes_employees, :nb_total_employes, :employes_parite, :actions_egalite, :nb_femmes_candidates, :nb_total_candidats, :candidates_parite, :nb_femmes_laureates, :nb_total_laureates, :laureates_parite, :nb_femmes_jurys, :nb_total_jurys, :jurys_parite)
  end
end
