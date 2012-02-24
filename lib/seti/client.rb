# Client Class
#
# builds a base class for all the api calls
# to inherit from.
#
# @example
#   seti = Seti::Client.new
#   seti.kepler_schedule
#
# @example
#   Seti.get.kepler_schedule

require "seti/requests"

module Seti
  
  class Client
    # include all other classes to inherit
    include Requests
    
    # Creating the base client
    #
    # @example
    #   Seti::Client.new
    def initialize(opts = {})
      connection
    end

    # Creates a Faraday connection block
    #
    # @return [Faraday::Connection]
    def connection
      @connection ||= Faraday.new(url: base_url, headers: default_headers) do |builder|
        builder.use Faraday::Request::UrlEncoded
        builder.use Faraday::Response::Mashify
        builder.use Faraday::Response::ParseJson, content_type: /\bjson$/
        builder.use Faraday::Response::ParseXml,  content_type: /\bxml$/
        builder.adapter Faraday.default_adapter
      end
    end

    protected

      # @protected
      def base_url
        "http://setiquest.info/"
      end
      
      # @protected
      def default_headers
        { user_agent: "Ruby gem" }
      end
  end
  
  class << self
    # attrs for storing the client object
    attr_accessor :client
  end

  def self.get
    self.client ||= Client.new
  end

end
