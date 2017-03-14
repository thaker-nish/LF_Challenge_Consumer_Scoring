module ConsumerScoring
  class Consumer
    URL = 'http://not_real.com/customer_scoring'

    def initialize(url = URL)
      @url = url
    end

    def scoring(income, zip_code, age)
      params = { income: income, zip_code: zip_code, age: age }
      response = RestClient.get(url, params: params).body do
        return ::JSON.parse(response)
      end
    end

    private

    attr_reader :url
  end
end
