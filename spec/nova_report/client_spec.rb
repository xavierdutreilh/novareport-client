require 'spec_helper'

describe NovaReport::Client do
  before(:all) do
    @url = "http://novagile.fr/api/measures.json"
    @api_key = SecureRandom.hex(32)
  end

  subject { NovaReport::Client.new(@url, @api_key)}

  it { should respond_to :url }
  it { should respond_to :url= }
  it { should respond_to :api_key}
  it { should respond_to :api_key=}

  its(:url) { should eq @url }
  its(:api_key) { should eq @api_key }

  describe '.included_modules' do
    subject { NovaReport::Client.included_modules }

    it { should include HTTParty }
  end

  describe '#push' do
    before(:all) do
      @hash = {
        :"key#{SecureRandom.random_number(100000)}" => SecureRandom.hex(32)
      }
    end

    before do
      NovaReport::Client.should_receive(:post).with(@url, body: @hash.merge(auth_token: @api_key)).and_return(true)
    end

    subject { NovaReport::Client.new(@url, @api_key).push(@hash)}

    it { should be_true }
  end

  describe '#push_measure' do
    before(:all) do
      @metric = SecureRandom.hex(32)
      @value = SecureRandom.random_number(100000)
    end

    before do
      NovaReport::Client.any_instance.should_receive(:push).with(measure: {
        metric: @metric,
        value: @value,
        measured_at: @measured_at
      }).and_return(true)
    end

    subject { NovaReport::Client.new(@url, @api_key).push_measure(@metric, @value, @measured_at)}

    it { should be_true }
  end
end
