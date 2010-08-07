class User < ActiveRecord::Base
  validates_presence_of :phone_number, :registration_identifier
  before_validation_on_create :normalize_phone_number

  named_scope :by_phone_numbers, lambda {|phone_numbers|
    {
      :conditions => {:phone_number => phone_numbers.map{|pn| pn.gsub(/\D+/,'')}}
    }
  }

  private

  def normalize_phone_number
    self.phone_number = self.phone_number.gsub(/\D+/,'')
  end
end
