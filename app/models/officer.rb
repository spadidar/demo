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
    o = Officer.find_or_create_by(name: json["guid"])
    o.location = json["location"]
    o.orientation = json["orientation"]
    o.running = json["running"]
    o.shots = json["shots"]
    o.save
    return o
  end

end
