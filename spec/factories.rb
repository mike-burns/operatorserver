Factory.sequence(:phone_number) {|n| "617867530#{n}" }
Factory.sequence(:registration_id) {|n| n}

Factory.define :user do |user_factory|
  user_factory.phone_number { Factory.next(:phone_number) }
  user_factory.registration_identifier { Factory.next(:registration_id) }
end
