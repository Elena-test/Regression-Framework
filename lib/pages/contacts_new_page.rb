class ContactNewPage
  include PageObject

  page_url 'http://134.122.124.216:3000/contacts/new'

  text_field(:contact_first_name, id: 'contact_first_name')
  text_field(:contact_last_name, id: 'contact_last_name')
  text_field(:contact_street, id: 'contact_street')
  text_field(:contact_city, id: 'contact_city')
  text_field(:contact_state, id: 'contact_state')
  text_field(:contact_postal_code, id: 'contact_postal_code')
  text_field(:contact_cell_phone, id: 'contact_cell_phone')
  text_field(:contact_home_phone, id: 'contact_home_phone')
  text_field(:contact_fax, id: 'contact_fax')
  text_area(:contact_notes, id: 'contact_notes')
  button(:submit, id: 'contact_submit')

  def create_contact(params = {})
    self.contact_first_name = params[:contact_first_name] || 'Tom'
    self.contact_last_name = params[:contact_last_name] || 'Black'
    self.contact_street = params[:contact_street]
    self.contact_city = params[:contact_city]
    self.contact_state = params[:contact_state]
    self.contact_postal_code = params[:contact_postal_code]
    self.contact_cell_phone = params[:contact_cell_phone]
    self.contact_home_phone = params[:contact_home_phone]
    self.contact_fax = params[:contact_fax]
    self.contact_notes = params[:contact_notes]
    submit
  end
end
