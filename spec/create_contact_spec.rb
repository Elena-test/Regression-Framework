describe 'Create contact' do
  before(:all) do
    @email = Faker::Internet.email
    @first_name = Faker::Internet.username
    @last_name = Faker::Internet.username
    @street = 'Street'
    @city = 'City'
    @state = 'State'
    @contact_postal_code = '6540'
    @contact_cell_phone = '9999999999'
    @contact_home_phone = '8888888888'
    @contact_fax = '7865748888'
    @notes = 'My small note'

    visit HomePage, &:my_account

    on SigninPage, &:sign_up

    on SignupPage do |page|
      page.input_user_details(
          email: @email,
          password: 'HappyBirthday1'
      )
    end

    visit ContactNewPage
    on ContactNewPage do |page|
      page.create_contact(
          contact_first_name: @first_name,
          contact_last_name: @last_name,
          contact_street: @street,
          contact_city: @city,
          contact_state: @state,
          contact_postal_code: @contact_postal_code,
          contact_cell_phone: @contact_cell_phone,
          contact_home_phone: @contact_home_phone,
          contact_fax: @contact_fax,
          contact_notes: @notes,

      )
    end
  end

  after(:all) do
    visit EditUserPage, &:cancel_and_confirm
  end

  it 'successfully' do
    on ContactItemPage do |page|
      expect(page.notice).to include("Contact was successfully updated.")
    end
  end
end
