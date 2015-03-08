desc 'botsy ping', 'test if botsy is listening'
hear /^botsy ping$/i do
  'pong'
end

desc 'botsy say', 'test post to channel'
hear /^botsy say (.*)$/i do |mdata|
  say mdata[1]
end
