class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contacts_params)
    @contact.type = "newsletter"
    if @contact.save
      redirect_to root_path, notice: 'Votre demande a bien été prise en compte.'
    else
      redirect_to root_path
    end
  end

  private
  def contacts_params
    params.require(:contact).permit(
      :email,
      :type,
      :message
      )
  end
end
