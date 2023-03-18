require 'mastodon'
require 'dotenv'
require 'logger'

# 環境変数の読み込み
Dotenv.load

# ロガーの生成
logger = Logger.new(STDERR)


client = Mastodon::REST::Client.new(base_url: ENV['MASTODON_URL'], bearer_token: ENV['ACCESS_TOKEN'])

text = 'Set a fire in your heart, Spartan! Bare your fangs! Fight hard! Die well.'

params = {
  visibility: 'unlisted'
}

10.times do
  response = client.create_status(text, params)
  logger.info(response)
end
