module XmlHelpers
  def phone_number_xml(phone_numbers)
    builder = Builder::XmlMarkup.new
    builder.contacts do |contacts|
      phone_numbers.each do |phone_number,|
        contacts.contact do |contact|
          contact.phone phone_number.gsub(/\s+/,'')
        end
      end
    end
  end
end

World(XmlHelpers)
