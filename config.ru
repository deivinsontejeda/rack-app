require 'rubygems'
require 'geocoder'
require './fake_ip_middleware'

# Rack App
class SimpleRackApp
  class << self
    def call(env)
      req = Rack::Request.new env
      [200, {}, ["Country Code: #{req.location.country_code}"]]
    end
  end
end

run FakeIpMiddleware.new(SimpleRackApp, '187.16.144.141')
