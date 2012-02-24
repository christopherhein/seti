require "spec_helper"

describe Seti::Client do

  let(:client) { Seti::Client.new }

  context "instantiation" do
    
    it "should have a new method" do
      Seti::Client.should respond_to :new
    end
    
    it "should create a faraday connection when instantiated" do
      Seti::Client.new.should be_kind_of Seti::Client
    end

  end

  context "setting up the connection" do
    let(:connection) { client.connection }
    
    it "should repond_to connection" do
      client.should respond_to :connection
    end

    it "should return the base url" do
      client.send(:base_url).should eq "http://setiquest.info/"
    end

    it "should return a hash for default headers" do
      client.send(:default_headers).should be_kind_of Hash
    end

    it "should return a faraday connection" do
      connection.should be_kind_of Faraday::Connection
    end

  end

  context "calling the api with out creating a new client" do
    
    it "should respond_to :client" do
      Seti.should respond_to :client
    end

    it "should respond_to :get" do
      Seti.should respond_to :get
    end

    it "should be able to make trailing requests" do

    end

    it "should be kind of Seti::Client" do
      Seti.get.should be_kind_of Seti::Client
    end

  end

end
