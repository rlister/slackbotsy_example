desc 'botsy insult NAME', 'insult NAME in an erudite manner'
hear /\bbotsy[,;:\s]+insult\s+(.+)/ do |mdata|
  name = mdata[1].strip.split.map(&:capitalize).join(' ')
  "#{name}: #{insult}"
end
