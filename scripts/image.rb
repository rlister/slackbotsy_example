desc 'botsy make NAME a THING', 'get a picture of THING'
hear /\bbotsy[,;:\s]+(sudo )?make (me|.+)\s(a|an|some|the)\s(.+)/i do |mdata|
  if mdata[4].match(/sandwich/i) and not mdata[1]
    'What? Make it yourself.'   # only make a sandwich if you say sudo
  else
    google_image_search(mdata[4])
  end
end

desc '<<THING>>', 'get a picture of THING'
hear /&lt;&lt;([^&]+)&gt;&gt;/ do |mdata|
  google_image_search(mdata[1])
end
