class Api::HipsterIpsum
  include HTTParty

  def self.default_text
    get('https://hipsum.co/api/?type=hipster-centric&paras=3').parsed_response.join("\n\n")
  end
end
