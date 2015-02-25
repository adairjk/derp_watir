Given(/^I submit the Simple Example form with valid form data$/) do
  pets = %w(Cat Dog Rabbit Snake Horse)
  @form_data = {first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: Faker::Internet.email,
                web_site: Faker::Internet.url,
                pet: pets.sample}
  @browser.link(text: 'Simple Example').click
  @browser.text_field(id: 'first_name').set @form_data[:first_name]
  @browser.text_field(id: 'last_name').set @form_data[:last_name]
  @browser.text_field(id: 'email').set @form_data[:email]
  @browser.text_field(id: 'website_url').set @form_data[:web_site]
  @browser.button(id: 'pet_select').click
  @browser.button(id: 'pet_select').parent.link(text: @form_data[:pet]).click
  @browser.li(id: 'submit_example').button.click
end

Then(/^I should see that the form has been submitted successfully$/) do
  @browser.section(id: 'results').h1.text.should eql "Thank you #{@form_data[:first_name]} for submitting the form"
end