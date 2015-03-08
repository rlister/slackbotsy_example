module Slackbotsy

  module Helper

    ## get a random unix fortune
    def fortune (db = nil)
      url =  'http://anduin.eldar.org/cgi-bin/fortune.pl?text_format=yes'
      url += "&fortune_db=#{db}" if db
      begin
        open url, &:read
      rescue
        'get back to work'
      end
    end

  end

end
