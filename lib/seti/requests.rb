# Requests module
#
# gets included in the client this is where all the api calls are actually made

module Seti

  module Requests

    def kepler_schedule
      make_request("kep365.xml").info.uptime
    end
    
    def ata_status
      make_request("sonatastatus.json")
    end
    
    def ata_schedule
      make_request("sonataschedule.json")
    end

    def observation_report
      make_request("obsreport.json")
    end

    protected
      
      # @protected
       def make_request(path)
         connection.get("feeds/#{path}").body
       end

  end

end
