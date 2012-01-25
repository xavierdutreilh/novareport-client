module NovaReport
  class Client
    include HTTParty

    attr_accessor :url, :api_key

    def initialize(url, api_key)
      @url = url
      @api_key = api_key
    end

    def push(hash)
      self.class.post(@url, body: hash.merge(
        auth_token: @api_key
      ))
    end

    def push_measure(metric_id, value, measured_at = Time.now)
      push(measure: {
        metric_id: metric_id,
        value: value,
        measured_at: measured_at
      })
    end
  end
end
