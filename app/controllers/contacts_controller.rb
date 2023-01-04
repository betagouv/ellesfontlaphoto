class ContactsController < ApplicationController
  invisible_captcha only: [:create]

  def create
    unless params[:email].present?
      @contact = Contact.new(contacts_params)
      unless @contact.contact_email == "foo-bar@example.com"
        if @contact.save
          if @contact.contact_type == "newsletter"
            add_to_sendinblue_list(@contact.contact_email)
          else
            ContactMailer.new_contact(@contact).deliver_later
          end
          respond_to do |format|
            format.html { render redirect_to root_path(anchor: 'contact'), notice: 'Votre demande a bien été prise en compte.'}
            format.text { render partial: 'shared/modale_contact_done', formats: [:html] }
          end
        else
          respond_to do |format|
            format.html { render redirect_to root_path }
            format.text { render partial: 'shared/form_new_contact', locals: { contact: @contact, error_save: true }, formats: [:html] }
          end
        end
      end
    end
  end

  private

  def contacts_params
    params.require(:contact).permit(
      :contact_email,
      :contact_type,
      :comment,
      :accept_cgu
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
