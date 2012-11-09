require 'spec-helper'

describe Nytimes::Events::Base do
  it "should form the correct url from a basic query string" do
    base = Nytimes::Events::Base.new("XXXX")
    base.api_url('query' => 'food').should == "http://api.nytimes.com/svc/events/v2/listings.json?query=food&api-key=XXXX"
  end

  it "should substitute spaces with plusses" do
    base = Nytimes::Events::Base.new("XXXX")
    base.api_url('query' => 'foo bar').should == "http://api.nytimes.com/svc/events/v2/listings.json?query=foo+bar&api-key=XXXX"
  end
end