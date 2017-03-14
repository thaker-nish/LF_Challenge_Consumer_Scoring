module ConsumerScoring
  class Consumer
    URL = 'http://not_real.com/customer_scoring'

    def initialize(url = URL)
      @url = url
    end

    def scoring(income, zip_code, age)
      params = { income: income, zip_code: zip_code, age: age }
      response = RestClient.get(url, params: params).body
      return response
    end

    private

    attr_reader :url
  end
end
