class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contacts_params)
    if @contact.save
      if @contact.contact_type = "newsletter"
        redirect_to root_path(anchor: 'contact'), alert: 'Votre demande a bien été prise en compte.'
      else
        redirect_to root_path(anchor: 'contact'), notice: 'Votre demande a bien été prise en compte.'
      end
    else
      if @contact.contact_type = "newsletter"
        redirect_to root_path(anchor: 'contact'), alert: 'Un problème est survenu, réessayez.'
      else
        redirect_to root_path(anchor: 'contact'), notice: 'Un problème est survenu, réessayez.'
      end
    end
  end

  private
  def contacts_params
    params.require(:contact).permit(
      :email,
      :contact_type,
      :message
      )
  end
end
