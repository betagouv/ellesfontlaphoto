class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contacts_params)
    # raise
    if @contact.save
      if @contact.contact_type == "newsletter"
        add_to_sendinblue_list(@contact.contact_email)
        redirect_to root_path(anchor: 'contact'), alert: 'Votre demande a bien été prise en compte.'
      else
        redirect_to root_path(anchor: 'contact'), notice: 'Votre demande a bien été prise en compte.'
      end
    else
      if @contact.contact_type == "newsletter"
        redirect_to root_path(anchor: 'contact'), alert: 'Un problème est survenu, réessayez.'
      else
        redirect_to root_path(anchor: 'contact'), notice: 'Un problème est survenu, réessayez.'
      end
    end
  end

  private

  def contacts_params
    params.require(:contact).permit(
      :contact_email,
      :contact_type,
      :message
      )
  end

  def add_to_sendinblue_list(email)
    # SendInBlue : put email address in List #57[Newsletter]
    url = URI('https://api.sendinblue.com/v3/contacts')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    email = email
    list_id = 57
    request = Net::HTTP::Post.new(url)
    request['accept'] = 'application/json'
    request['content-type'] = 'application/json'
    request['api-key'] = Figaro.env.sendinblue_api_key
    request.body = "{\"email\":\"#{email}\",\"listIds\":[#{list_id}],\"updateEnabled\":true}"
    response = http.request(request)
    puts response.read_body
  end
end
