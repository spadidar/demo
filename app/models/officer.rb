require 'open-uri'
class Officer

  include Mongoid::Document
  include Mongoid::Timestamps

  field :guid,         :type => String,:default => ""
  field :name,         :type => String,:default => ""
  field :location,  :type => String,:default => ""
  field :orientation,        :type => String,:default => ""
  field :running,         :type => String,:default => ""
  field :shots,         :type => String, :default => ""

  def self.store json
    o = Officer.find_or_create_by(guid: json["guid"])
    o.name = json["name"] if json.has_key?("name")
    o.location = json["location"] if json.has_key?("location")
    o.orientation = json["orientation"] if json.has_key?("orientation")
    o.running = json["running"] if json.has_key?("running")
    o.shots = json["shots"] if json.has_key?("shots")
    o.save
    return o
  end

  def address
    url = URI.parse "http://maps.google.com/maps/api/geocode/json?latlng=#{location}&sensor=false"
    response = ""
    open(url) do |http|
      response = http.read
    end
    json = JSON.parse response
    Kernel.p json
    results = json["results"]
    
    if results.size >= 1
      results.first["formatted_address"]
    else
      ""
    end
  end
  
  def longt
    return "" if location.blank?
    if location.split(",").size > 1
      return location.split(",").first
    end
  end
  
  def lat
    return "" if location.blank?
    if location.split(",").size > 1
      return location.split(",").last
    end
  end

end
