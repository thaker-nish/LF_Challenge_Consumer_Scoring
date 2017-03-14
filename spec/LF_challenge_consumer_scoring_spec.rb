require "spec_helper"

describe LFChallengeConsumerScoring do
  it "has a version number" do
    expect(LFChallengeConsumerScoring::VERSION).not_to be nil
  end

    describe '#initialize' do
  it 'should have a vaild url' do
    consumer = ConsumerScoring::Consumer.new
    url = 'http://not_real.com/customer_scoring'
    expect(consumer.send(:url)).to eq(url)
  end
       it "should allow another url to be specified" do
      custom_url = "http://paulnsorensen.com"
      client = ConsumerScoring::Consumer.new(custom_url)
      expect(client.send(:url)).to eql(custom_url)
    end
  end
  describe "#scoring" do
    context "when successful" do
      before(:all) do
        test_url =  ConsumerScoring::Consumer::URL
        test_url += "?age=35&income=50000&zipcode=60621"
        stub_request(:get, "http://not_real.com/customer_scoring?age=35&income=50000&zip_code=60621").to_return(status: 200, body: '{propensity: 0.26532,ranking: "C"}')
        consumer = ConsumerScoring::Consumer.new
        @result = consumer.scoring("50000", "60621", "35")
        @result = eval(@result)
      end

      it "should return an hash" do
        expect(@result).to be_kind_of(Hash)
      end
      it "should only include 'propensity' and 'ranking" do
        expect(@result.keys.sort).to eql([:propensity, :ranking])
      end
      it "should have the correct value for 'propensity'" do
        expect(@result[:propensity]).to be(0.26532)
      end

      it "should have the correct value for 'ranking'" do
        expect(@result[:ranking]).to eql('C')
      end
    end
  end
end
