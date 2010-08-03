Then 'the server responds with a 200' do
  @response.code.to_i.should == 200
end

Then 'the server responds with no body' do
  @response.body.should be_blank
end
