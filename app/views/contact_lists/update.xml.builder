xml.contacts do |contacts|
  @users.each do |user|
    contacts.contact do |contact|
      contact.phone user.phone_number
    end
  end
end
