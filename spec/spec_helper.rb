require 'skymorph'
require 'fixtures'
require 'pry'

module SkyMorph
  module Helpers
    def net_http_double
      factory = double 'http_factory'
      factory.stub(:start) { 'Http response' }
      factory
    end
  end
end

RSpec.configure do |c|
  c.include SkyMorph::Helpers
end