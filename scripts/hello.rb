hear /\b(hello|hi|(good\s?)?(morning|afternoon|evening))\W+botsy$/i do
  [
    "hello, #{user_name}",
    "hi #{user_name}!",
    "howdy",
    "hiya #{user_name} :smiley_cat:",
    "what's up, #{user_name}?",
    "hey, #{user_name}, how's it going?"
  ].sample
end

hear /\b((good\s?)?(night|bye)|see\s?ya|cya|later|l8rs?|farewell|adios)\W+botsy$/i do
  [
    "goodbye, #{user_name}",
    "adios #{user_name}",
    "au revoir",
    "bye #{user_name}",
    "toodles :wave:",
    "adieu",
    "so long, #{user_name}",
    "sayonara",
    "cheerio"
  ].sample
end
