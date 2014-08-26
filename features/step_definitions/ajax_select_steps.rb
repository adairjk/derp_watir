Given(/^I am on the "(.*?)" page$/) do |page|
  @browser.link(text: page).click
end

When(/^I choose a Year and Make and submit the form$/) do
  @browser.button(id: 'universal_year').when_present.click
  year = @browser.div(class: 'vehicle-year').lis.to_a.drop(1).sample.link
  @selected_year = year.text
  year.click

  @browser.button(id: 'universal_make').click
  make = @browser.div(class: 'vehicle-make').lis.to_a.drop(1).sample.link
  @selected_make = make.text
  make.click

  @browser.button(id: 'submit_ajax').click
end

Then(/^I should see that the form was submitted successfully$/) do
  @browser.section(id: 'ajax_results').h1.text.should eql 'Thank you for submitting the form'
end

Then(/^I should see my selections displayed on the page$/) do
  @browser.text_field(name: 'vehicle.year').when_present.value.should eql @selected_year
  @browser.text_field(name: 'vehicle.make').value.should eql @selected_make
end