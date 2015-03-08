require 'json'

module Slackbotsy

  module Helper

    ## return a random image from google for query;
    ## it is generally advisable to leave 'safe=active' in the request
    def google_image_search(query)
      tries ||= 3
      url = URI.parse "http://ajax.googleapis.com/ajax/services/search/images?v=1.0&rsz=8&safe=active&q=#{URI.escape(query)}"

      response = JSON::parse Net::HTTP.get_response(url).body
      raise 'no response' if response.nil?

      results = response.fetch('responseData', {}).fetch('results', [])
      raise 'no results' if results.empty?

      results.sample.fetch('unescapedUrl', 'no url')
    rescue => e
      if (tries -= 1) > 0
        say "hang on a sec ... (#{e.message})"
        sleep 3
        retry
      else
        [ 'teh intarwebz are down', 'do you know the AOL keyword for that?', 'bzzzzt', 'where am I?' ].sample
      end
    end

  end

end
