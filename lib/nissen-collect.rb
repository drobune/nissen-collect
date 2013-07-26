# -*- encoding: utf-8 -*-
require 'yaml'
require 'faraday'
require 'active_support/core_ext'
require 'erb'
require 'nissen-collect/version'
require 'nissen-collect/transaction.rb'
require 'nissen-collect/getauthor.rb'
require 'nissen-collect/modifytransaction.rb'
require 'nissen-collect/pdrequest.rb'
require 'nissen-collect/cancel.rb'

# nissen collect APIwrapper
module NissenCollect
  $:.unshift(File.dirname(File.expand_path(__FILE__)))
  ROOT_HOST = 'https://collect-operation.nissen.co.jp/'
  SHOPINFO = HashWithIndifferentAccess.new(YAML.load(ERB.new(File.read('lib/nissen-collect/body/shopInfo.yml')).result))
  HTTPINFO = HashWithIndifferentAccess.new(YAML.load_file('lib/nissen-collect/body/httpInfo.yml'))
  BUYER = HashWithIndifferentAccess.new(YAML.load_file('lib/nissen-collect/body/buyer.yml'))
  DELIVERIES = HashWithIndifferentAccess.new(YAML.load_file('lib/nissen-collect/body/deliveries.yml'))
  PDREQUEST = HashWithIndifferentAccess.new(YAML.load_file('lib/nissen-collect/body/PdRequest.yml'))
  TRANSACTION = HashWithIndifferentAccess.new(YAML.load_file('lib/nissen-collect/body/transaction.yml'))

  class Client

    # リクエストの作成
    # @param [String] target_host リクエスト先ホスト
    # @param [Xml] params リクエストボディ
    # @return [Proc] request_setup リクエスト
    def request_setup target_path, params
      Proc.new do |req|
        req.body = params
        req.url target_path
      end
    end

    # httpsコネクションの作成
    # @return [object] connection Faraday::Connection
    def connection
      @connection = Faraday::Connection.new(ROOT_HOST,ssl:{verify:true}) do |builder|
        builder.use Faraday::Request::UrlEncoded  # リクエストパラメータを URL エンコードする
        builder.use Faraday::Response::Logger     # リクエストを標準出力に出力する
        builder.use Faraday::Adapter::NetHttp     # Net/HTTP をアダプターに使う
      end
    end

    # httpsリクエスト送信
    # @param [String] method 実行するhttpメソッド
    # @param [String] target_path リクエスト送信先パス
    # @params [Hash] params リクエストのbody
    # @return [Hash] httpレスポンス
    def request method, target_path, params
      request_setup = request_setup(target_path, params.to_xml(root:'request'))
      connection.send(method.to_sym, &request_setup).env
      rescue Faraday::Error::ClientError
        raise Twitter::Error::ClientError
      rescue JSON::ParserError
        raise Twitter::Error::ParserError
    end
  end

end
