# coding: utf-8

require 'rakuten_web_service'
require 'yaml'
require 'pp'

APP_DIR = File.dirname(__FILE__)
CONFIG_PATH = APP_DIR + '/' + 'secret_config.yaml'

config = YAML.load_file(CONFIG_PATH)

# コンフィグ
RakutenWebService.configuration do |c|
  c.application_id = config['YOUR_APPLICATION_ID']
  c.affiliate_id = config['YOUR_AFFILIATE_ID']
end

# ジャンル
root = RakutenWebService::Ichiba::Genre.root # root genre
# children returns sub genres
root.children.each do |child|
  puts "[#{child.id}] #{child.name}"
end

# ジャンル
root = RakutenWebService::Books::Genre.root # root genre
# children returns sub genres
root.children.each do |child|
  puts "[#{child.id}] #{child.name}"
end

# ジャンル
root = RakutenWebService::Books::Genre['001'] # root genre
# children returns sub genres
root.children.each do |child|
  puts "[#{child.id}] #{child.name}"
  child.children.each do |c|
    puts "[#{c.id}] #{c.name}"
  end
end
