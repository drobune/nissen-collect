$:.unshift File.dirname(__FILE__)
#require 'nissen/collect/version'
require 'collect/version'
require 'yaml'
require 'net/http'


#=nissen collect APIwrapper
module NissenCollect
  ROOT_HOST = 'collect-operation.nissen.co.jp'
  REQUEST_BODY = YAML.load_file('./collect/body.yml')

  #httpsリクエストの作成
  def self.https
    https = Net::HTTP.new(ROOT_HOST, 443)
    https.use_ssl=true
    https
    #https.get('/')
  end

end

