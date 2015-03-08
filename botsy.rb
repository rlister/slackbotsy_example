require 'sinatra'
require 'slackbotsy'

## our working dir
dirname = File.dirname(File.expand_path(__FILE__))

## load helper functions
Dir.glob(File.join(dirname, 'helpers', '**')).each do |helper|
  require helper
end

## configure with environment variables
config = %w[channel name incoming_webhook outgoing_token].inject({}) do |hash, var|
  hash[var] = ENV[var.upcase]
  hash
end

bot = Slackbotsy::Bot.new(config)

## load all configs in this dir
bot.eval_scripts(Dir[File.join(dirname, 'scripts', '**', '*.rb')])

## receive from slack
post '/' do
  bot.handle_item(params)
end
