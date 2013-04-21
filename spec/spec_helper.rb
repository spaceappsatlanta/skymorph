require 'skymorph'
require 'fixtures'
require 'pry'

module SkyMorph
  module Helpers
    def http_client_double response_string=''
      response = double 'response'
      response.stub(:body_str) { response_string }

      client = double 'http_client'
      client.stub(:perform) { response }
      client
    end
  end
end

RSpec.configure do |c|
  c.include SkyMorph::Helpers
end