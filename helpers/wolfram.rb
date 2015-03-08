# -*- coding: utf-8 -*-

## you will need to sign up for free API key at:
## http://products.wolframalpha.com/api/
## and set env var WOLFRAM_APPID for botsy

require 'wolfram'

module Slackbotsy

  module Helper

    ## look query up on wolfram and return string or array of strings
    def wolfram_query(query)
      Wolfram.appid = ENV['WOLFRAM_APPID']

      result = Wolfram::Query.new(query).fetch

      ## 1st result is interpretation, so skip it and show next 2
      if result.success?
        sections = result.pods[1,2].map do |p|
          p.plaintext.empty? ? p.img['src'].concat('#.gif') : p.plaintext
        end
        Array(sections).map(&:to_s).join("\n")
      else
        [ 'er ...', 'hmmm', 'dunno', 'I need coffee', 'beats me', '*¯\_(ツ)_/¯*', 'that information is classified' ].sample
      end
    end

  end

end
