When 'a phone sends a request to register with the id "$registration_id"' do |registration_id|
  user = Factory(:user, :registration_identifier => registration_id)
  post registrations_path(:phone_number => user.phone_number, :registration_id => user.registration_identifier)
end

Given 'a phone with id "$registration_id" is already registered' do |registration_id|
  Factory(:user, :registration_identifier => registration_id)
end
