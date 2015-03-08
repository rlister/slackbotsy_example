## see helpers/wolfram.rb for the meat of this
hear /\bbotsy[,;:\s]+((who|what|when|where|why|how)\s+(.*))$/ do |mdata|
  wolfram_query(mdata[1].strip)
end
