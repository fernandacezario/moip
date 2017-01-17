Given(/^I generate ownId and set JSON request body to:$/) do |body|
  @body = JSON.dump(JSON.parse(body))
  @ownId = "tempownid-#{Time.now.to_i}"
  @body.gsub!(/tempOwnId/,@ownId)
end