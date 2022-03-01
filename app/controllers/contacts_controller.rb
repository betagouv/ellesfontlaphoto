class ContactsController < ApplicationController
  invisible_captcha only: [:create]

  def create
    unless params[:email].present?
      @contact = Contact.new(contacts_params)
      unless @contact.contact_email == "foo-bar@example.com"
        if @contact.contact_type == "newsletter"
          add_to_sendinblue_list(@contact.contact_email)
          redirect_to root_path(anchor: 'contact'), alert: 'Votre demande a bien été prise en compte.'
        else
          ContactMailer.new_contact(@contact).deliver_now
          redirect_to root_path(anchor: 'contact'), notice: 'Votre demande a bien été prise en compte.'
        end
      end
    end
  end

  private

  def contacts_params
    params.require(:contact).permit(
      :contact_email,
      :contact_type,
      :comment
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
