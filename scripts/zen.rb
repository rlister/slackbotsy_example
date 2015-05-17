require 'open-uri'

hear /\bzen\b/i do
  open('https://api.github.com/zen').read
end
