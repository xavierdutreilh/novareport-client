require 'rspec'
require 'securerandom'
require 'httparty'
require 'nova_report'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter = :documentation
end
