When /^a phone asks if the following phone numbers are in the system:$/ do |table|
  params = {:contacts => []}
  table.raw.each do |phone_number,|
    params[:contacts] << phone_number
  end
  put contact_list_path(params)
end
