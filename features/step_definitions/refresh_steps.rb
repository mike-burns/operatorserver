When /^a phone asks if the following phone numbers? (?:are|is) in the system:$/ do |table|
  params = {:contacts => []}
  table.raw.each do |phone_number,|
    params[:contacts] << phone_number
  end
  put contact_list_path(params)
end

Then 'the server responds with the following phone numbers:' do |table|
  xml = phone_number_xml(table.raw.map{|pn,| pn})
  @response.body.gsub(/\s+/,'').should == xml.gsub(/\s+/,'')
end
