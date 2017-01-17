Then(/^print the response$/) do
  print @response
end

Then(/^print the customer "([^"]*)"$/) do |customer|
  print customer
end

Then(/^the customer "([^"]*)" should be "([^"]*)"$/) do |key, value|
  expect(@customer[key]).to eq value
end

Then(/^the taxDocument "([^"]*)" should be "([^"]*)"$/) do |key, value|
  expect(@customer['taxDocument'][key]).to eq value
end

Then(/^the phone "([^"]*)" should be "([^"]*)"$/) do |key, value|
  expect(@customer['phone'][key]).to eq value
end

Then(/^the shippingAddress "([^"]*)" should be "([^"]*)"$/) do |key, value|
  expect(@customer['shippingAddress'][key]).to eq value
end

Then(/^I use the last ownId and set JSON request body to:$/) do |body|
  @body = JSON.dump(JSON.parse(body))
  @body.gsub!(/tempOwnId/,@ownId)
  p @body
  p @request
end

Then(/^print the errors$/) do
  @errors = JSON.parse(@response)['errors']
  @errors.each do |e|
    print "#{e}\n"
  end
end

Then(/^the items "([^"]*)" should be "([^"]*)"$/) do |key, value|
  expect(@order['items'][0][key]).to eq value
end

Then(/^the items "([^"]*)" should be equal (\d+)$/) do |key, value|
  expect(@order['items'][0][key]).to eq value.to_i
end

Then(/^the payment status must be pago$/) do
  click_on @ownId
  expect(page).to have_content(@payment_id)
  expect(page).to have_content('Pago')
end