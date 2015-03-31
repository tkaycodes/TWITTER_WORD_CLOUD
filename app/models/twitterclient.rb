class Twitterclient

  def self.client
    @client ||= Twitter::REST::Client.new do |config|;
      config.consumer_key = "4QhFWrHOHti3NCpzyXWPEWH9S";
      config.consumer_secret = "kltQq8AmwSSoNigNlk7MUPqM5zWPrNCR1cgfxhlWwlKJbWFZ19";
      config.access_token = "398471310-RES7sRpSpJWZ5LZLiCUUHiaGKRO3QjNCDqy36sv0";
      config.access_token_secret = "ayBE0gLPxHrYaTSLtdJbITQSUPRTf0PBzhpBn4yxcrBcu";
    end
  end

end
