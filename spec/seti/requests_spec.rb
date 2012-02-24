require "spec_helper"

class DummyClass; end

describe Seti::Requests do
  let(:klass) { DummyClass.new }
  let(:requests) { klass.extend(Seti::Requests) }
  let(:client) { Seti.get }

  context "instantiation" do
  end

  context "defining api calls" do
  
    it "should respond_to kepler_schedule" do
      requests.should respond_to :kepler_schedule
    end
    
    it "should get return an array for schedule" do
      client.kepler_schedule.should be_kind_of Array
    end

    it "should respond_to ata_status" do
      requests.should respond_to :ata_status
    end
    
    it "should get return an Hash for ata_status" do
      client.ata_status.should be_kind_of Hash
    end
    
    it "should respond_to ata_schedule" do
      requests.should respond_to :ata_schedule
    end

    it "should return a hash for ata_schedule" do
      client.ata_schedule.should be_kind_of Hash
    end
    
    it "should respond_to :observation_report" do
      requests.should respond_to :observation_report
    end

    it "should return a hash for :observation_report" do
      client.observation_report.should be_kind_of Hash
    end

  end

end
