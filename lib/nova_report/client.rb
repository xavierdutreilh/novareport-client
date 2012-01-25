module NovaReport
  class Client
    include HTTParty

    attr_accessor :api_key

    def initialize(api_key)
      @api_key = api_key
    end

    def push(url, hash)
      self.class.post(url, body: hash.merge(
        auth_token: @api_key
      ))
    end

    def push_measure(url, metric_id, value, measured_at = Time.now)
      push(url, measure: {
        metric_id: metric_id,
        value: value,
        measured_at: measured_at
      })
    end
  end
end
