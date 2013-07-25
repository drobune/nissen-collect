# -*- encoding: utf-8 -*-
$:.unshift File.dirname(__FILE__)
require 'collect/version'
require 'yaml'
require 'faraday'
require 'active_support/core_ext'
require 'erb'

# nissen collect APIwrapper
module NissenCollect
  ROOT_HOST = 'https://collect-operation.nissen.co.jp/'
  REQUEST_BODY = HashWithIndifferentAccess.new(YAML.load(ERB.new(File.read('./collect/body.yml')).result))

  SHOPINFO = HashWithIndifferentAccess.new(YAML.load(ERB.new(File.read('./collect/shopInfo.yml')).result))
  HTTPINFO = HashWithIndifferentAccess.new(YAML.load_file('./collect/httpInfo.yml'))
  BUYER = HashWithIndifferentAccess.new(YAML.load_file('./collect/buyer.yml'))
  DELIVERIES = HashWithIndifferentAccess.new(YAML.load_file('./collect/deliveries.yml'))
  PDREQUEST = HashWithIndifferentAccess.new(YAML.load_file('./collect/Pdrequest.yml'))
  TRANSACTION = HashWithIndifferentAccess.new(YAML.load_file('./collect/transaction.yml'))

  class Client

    # リクエストの作成
    # @param [Chr] target_host リクエスト先ホスト
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

    def request method, target_path, params
      request_setup = request_setup(target_host, params)
      connection.send(method.to_sym, &request_setup).env
      rescue Faraday::Error::ClientError
        raise Twitter::Error::ClientError
      rescue JSON::ParserError
        raise Twitter::Error::ParserError
    end

  end

end

