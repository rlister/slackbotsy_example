hear /\bbotsy[\s:,]+i (love|hate)\s+(.*)$/i do |match|
  name = self['user_name'] || 'dude'
  "#{name}, I #{match[1]} #{match[2]} too!"
end
