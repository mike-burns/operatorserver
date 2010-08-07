require 'spec_helper'

describe User do
  it 'produces all users with matching phone numbers when sent .by_phone_numbers' do
    matching = %w(617 606 0842 617 857 5309)
    non_matching = %w(555 617 1212 617 555 1212)
    users = matching.map {|phone_number| Factory(:user, :phone_number => phone_number.gsub(' ',''))}
    Factory(:user)

    User.by_phone_numbers(non_matching+matching).should == users
  end
end
