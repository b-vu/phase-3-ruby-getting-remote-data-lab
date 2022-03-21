require "pry"
require "net/http"
require "open-uri"
require "json"

# Write your code here
class GetRequester
    def initialize(url)
        self.class.attr_accessor(:url)
        self.send("url=", url)
    end

    def get_response_body
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def parse_json
        JSON.parse(self.get_response_body)
    end
end

program = GetRequester.new("https://learn-co-curriculum.github.io/json-site-example/endpoints/people.json")

binding.pry