When(/^I open the URL "([^"]*)"$/) do |url|
  visit url
end

When(/^I sign in$/) do
  sleep 20
  fill_in 'login', with: 'fecezario83@gmail.com'
  fill_in 'password', with: 'Cezario@1983'
  click_on 'Acessar sua conta'
end

When(/^I send a POST request to create a payment$/) do
  request_url = URI.encode resolve("https://sandbox.moip.com.br/v2/orders/#{@order_id}/payments")
  @headers = {} if @headers.nil?
  begin
    response = RestClient.post request_url, @body, @headers
  rescue RestClient::Exception => e
    response = e.response
  end
  @response = CucumberApi::Response.create response
  @headers = nil
  @body = nil
end