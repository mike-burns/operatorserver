class User < ActiveRecord::Base
  validates_presence_of :phone_number, :registration_identifier
end
