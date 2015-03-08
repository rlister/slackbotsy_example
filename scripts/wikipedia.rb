require 'open-uri'
require 'nokogiri'

desc 'botsy tell me about SUBJECT', 'get educated by botsy'
hear /\bbotsy[,;:\s]+tell \w+ about\s+(.*)/i do |mdata|
  query = mdata[1].split(/\s+/).map { |word| word.capitalize }.join('_')

  begin
    doc = Nokogiri::HTML(open("http://en.wikipedia.org/wiki/Special:Search/#{query}").read())
    paragraphs = doc.css('p')
    summary = paragraphs.first.text

    ## list multiple matches
    if summary.match /may(\s+also){0,1}\s+refer to:$/
      doc.css('h2:has(span.mw-headline) ~ *').css('li').map{ |item| item.text }.join("\n")
    else
      summary.gsub(/\[([a-z]|\d+)\]/, '') # remove references in [...]
    end
  rescue
    [ "sorry", "no way", "huh?", "dunno", "que?", "I'm sorry #{user_name}, I'm afraid I can't do that" ].sample
  end
end
