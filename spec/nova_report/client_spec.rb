require 'spec_helper'

describe NovaReport::Client do
  before(:all) do
    @api_key = SecureRandom.hex(32)
  end

  subject { NovaReport::Client.new(@api_key)}

  it { should respond_to :api_key}
  it { should respond_to :api_key=}

  its(:api_key) { should eq @api_key }

  describe '.included_modules' do
    subject { NovaReport::Client.included_modules }

    it { should include HTTParty }
  end

  describe '#push' do
    before(:all) do
      @url = "http://novagile.fr/api/measures.json"
      @hash = {
        :"key#{SecureRandom.random_number(100000)}" => SecureRandom.hex(32)
      }
    end

    before do
      NovaReport::Client.should_receive(:post).with(@url, body: @hash.merge(auth_token: @api_key)).and_return(true)
    end

    subject { NovaReport::Client.new(@api_key).push(@url, @hash)}

    it { should be_true }
  end

  describe '#push_measure' do
    before(:all) do
      @url = "http://novagile.fr/api/measures.json"
      @metric_id = SecureRandom.hex(32)
      @value = SecureRandom.random_number(100000)
    end

    before do
      NovaReport::Client.any_instance.should_receive(:push).with(@url, measure: {
        metric_id: @metric_id,
        value: @value,
        measured_at: @measured_at
      }).and_return(true)
    end

    subject { NovaReport::Client.new(@api_key).push_measure(@url, @metric_id, @value, @measured_at)}

    it { should be_true }
  end
end
