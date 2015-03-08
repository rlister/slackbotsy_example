require 'nokogiri'

module Slackbotsy

  module Helper

    ## return a random shakespearian insult
    def insult
      Nokogiri.HTML(open('http://www.pangloss.com/seidel/Shaker/')).xpath("//font").first.content.strip.gsub('\n', ', ')
    rescue
      [ "make love, not war", "no way, man", "chillax, dude", "relax", "peace out", "I'm a lover not a fighter" ].sample
    end

  end

end
