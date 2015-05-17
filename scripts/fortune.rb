require 'open-uri'

hear /\briddles?\b/i do
  fortune :riddles
end

hear /\blimericks?\b/i do
  fortune :limerick
end

hear /\b(star\s*trek|trekkie|trekker|picard|kirk|spock)\b/i do
  fortune :startrek
end

hear /\b(futurama|bender|zoidberg|farnsworth|leela)\b/i do
  fortune :futurama
end

hear /\b(zippy|drunk)\b/i do
  fortune :zippy
end

hear /botsy[,;:]?\s+.*\b(excuses?|reasons?)\b/i do
  fortune('bofh-excuses').gsub(/BOFH excuse #\d+:\s*/, '')
end
