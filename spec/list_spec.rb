require 'spec-helper'

describe Nytimes::Events::List do
  it "raises an exception on 403" do
    listing = Nytimes::Events::List.new("XXXX")
    RestClient.stub(:get).and_return(RestClient::Response.create("{}", 403, {}))
    expect {listing.find('foo' => 'bar')}.to raise_error(RestClient::Exception)
  end

  it "parses the body of the response on 200" do
    listing = Nytimes::Events::List.new("XXXX")
    RestClient.stub(:get).and_return(RestClient::Response.create("{\"thing1\":\"thing2\"}", 200, {}))
    listing.find('foo' => 'bar').should == {'thing1' => 'thing2'}
  end
end