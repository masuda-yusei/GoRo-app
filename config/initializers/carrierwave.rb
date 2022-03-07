require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production? # 本番環境の場合はS3へアップロード
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory = ENV['AWS_S3_BUCKET_NAME'] # バケット名
    config.fog_public = false
    config.asset_host = ENV['AWS_S3_URL']
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['S3_AWS_ACCESS_KEY_ID'], # アクセスキー
      aws_secret_access_key: ENV['S3_AWS_SECRET_ACCESS_KEY'], # シークレットアクセスキー
      region: 'ap-northeast-1', # リージョン
      endpoint: 'https://s3.ap-northeast-1.amazonaws.com/',
      path_style: true
    }
  else # 本番環境以外の場合はアプリケーション内にアップロード
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end