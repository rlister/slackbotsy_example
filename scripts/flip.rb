# -*- coding: utf-8 -*-
require 'open-uri'

hear /\bflip\s+out\b/i do
  open('http://tableflipper.com/gif') do |f|
    if f.status[0].match /^2\d\d$/
      "<#{f.read}>"
    else
      "(╯°□°）╯︵ ┻━┻"
    end
  end
end
