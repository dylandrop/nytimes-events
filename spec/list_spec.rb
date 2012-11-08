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

  it "allows you to set and retrieve the batch size" do
    listing = Nytimes::Events::List.new("XXXX")
    listing.batch_size = 40
    listing.batch_size.should == 40
  end

  it "fetches the next 'batch' number of items when next_page is requested" do
    listing = Nytimes::Events::List.new("XXXX")
    RestClient.stub(:get).and_return(RestClient::Response.create("{\"num_results\":\"23\"}", 200, {}))
    listing.find('foo' => 'bar')
    listing.next_page
    listing.instance_variable_get(:@current_offset).should == listing.instance_variable_get(:@batch_size)
  end

  it "fetches the last 'batch' number of items when next_page is requested" do
    listing = Nytimes::Events::List.new("XXXX")
    RestClient.stub(:get).and_return(RestClient::Response.create("{\"thing1\":\"thing2\"}", 200, {}))
    listing.find('foo' => 'bar')
    listing.instance_variable_set(:@current_offset, 20)
    listing.prev_page
    listing.instance_variable_get(:@current_offset).should == 0
  end

  it "doesn't fetch the last items if the current offset would be negative" do
    listing = Nytimes::Events::List.new("XXXX")
    RestClient.stub(:get).and_return(RestClient::Response.create("{\"thing1\":\"thing2\"}", 200, {}))
    listing.find('foo' => 'bar')
    listing.instance_variable_set(:@current_offset, 0)
    listing.prev_page
    listing.instance_variable_get(:@current_offset).should == 0
  end

  it "doesn't fetch the next items if the new current offset would be greater than the number of results" do
    listing = Nytimes::Events::List.new("XXXX")
    RestClient.stub(:get).and_return(RestClient::Response.create("{\"num_results\":\"6\"}", 200, {}))
    listing.find('foo' => 'bar')
    listing.instance_variable_set(:@current_offset, 0)
    listing.next_page
    listing.instance_variable_get(:@current_offset).should == 0
  end
end