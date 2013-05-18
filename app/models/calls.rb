module Calls

  def self.post(body)

    @conn = Faraday.new(:url => "http://localhost:3000") do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    @conn.post do |req|
      req.url "api/store"
      req.headers['Content-Type'] = "application/json"
      body = body.to_json if body.is_a? Hash
      puts "=" * 100
      Kernel.p body
      req.body = body unless body.nil?
    end

  end

end
