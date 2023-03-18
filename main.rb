require 'mastodon'
require 'dotenv'
require 'logger'

# 環境変数の読み込み
Dotenv.load

# ロガーの生成
logger = Logger.new(STDERR)

# 実行回数を受け取る
num = gets.to_i

logger.info("Num = #{num}")

# Mastodonのクライアント生成
client = Mastodon::REST::Client.new(base_url: ENV['MASTODON_URL'], bearer_token: ENV['ACCESS_TOKEN'])

# 投稿内容を設定
text = ENV['STATUS_TEXT']

# 公開範囲を設定
params = {
  visibility: ENV['STAUTS_VISIBILITY']
}

# 実行回数分だけ投稿を作成
num.times do
  response = client.create_status(text, params)
  logger.info(response)
end
