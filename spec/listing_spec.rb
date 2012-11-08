require 'spec-helper'

describe Nytimes::Events::Listing do
  it "return nil on 403" do
    listing = Nytimes::Events::Listing.new("XXXX")
    RestClient.stub(:get).and_return(RestClient::Response.create("{}", 403, {}))
    expect {listing.find('foo' => 'bar')}.to raise_error(RestClient::Exception)
  end
end