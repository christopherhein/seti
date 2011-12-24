# == Basic API Connnector for SETI
# 
# Allows us to easily connect to the SETI api to get the data 
# to use:
# 
# for getting the ATA data
# 
#  Will respond with the json output of the ATA data
#   SetiApi.new
#  
#  Will respond with the xml format
#   SetiApi.new(format: "xml")
# 
#  Will get the daily report from setiquest
#   SetiApi.new(feed_type: "report")
# 
# 
# ==== Options that can be passed into this are:
# 
#   username: (if the api becomes locked by HTTP Auth Basic)
#   password: (if the api becomes locked by HTTP Auth Basic)
#   feed_type: "ata" || "report"
#   url: (if there is an explicit url you want to get the content of)
#   format: "json" || "xml"
# 
# 
# ==== Methods on the parsed data
# 
#  Will turn the json into a hash format
#   SetiApi.new().from_json
# 
#  Will turn the XML into a hash format 
#   SetiApi.new(format: "xml").from_xml

require 'active_support/core_ext'
require File.expand_path(File.join(File.dirname(__FILE__), "hash"))
require "typhoeus"
require "json"

class SetiApi
  
  def initialize(obj = {})
    @username = obj[:username] || nil
    @password = obj[:password] || nil
    @feed_type = obj[:feed_type] || "ata"
    @format = obj[:format] || "json"
    @url = obj[:url] || url
    @feed = feed
  end
  
  # == Feed Type Name
  # 
  # Get an expanded format of the short name
  # given for each of the feeds
  
  def feed_type_name
    case @feed_type
    when "ata" then
      "sonatastatus"
    when "report" then
      "obsreport"
    else
      "sonatastatus"
    end
  end
  
  # == Url 
  # 
  # Easily build a url for the setiquest.info url
  
  def url
    "http://setiquest.info/feeds/#{feed_type_name}.#{@format}"
  end

  # == Feed
  #
  # Makes an api call out to get the data from Gnip for the
  # current activites

  def feed
    if @username.nil? && @password.nil?
      Typhoeus::Request.get(@url)
    else
      Typhoeus::Request.get(@url, username: @username, password: @password)
    end
  end


  # == To Hash
  #
  # Turning all the data into a ruby hash to make it easier to
  # ingest into whatever structure we need it in

  def parse_xml
    Hash.from_xml(@feed.body).recursive_symbolize_keys!
  end
  
  # == Parse JSON
  # 
  # Creating a hash form the JSON representation of the data
  
  def parse_json
    JSON.parse(@feed.body)
  end
  
end