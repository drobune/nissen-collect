# -*- encoding: utf-8 -*-
$:.unshift File.dirname(__FILE__)
#require 'nissen/collect/version'
require 'collect/version'
#require 'yaml'
require 'faraday'
require 'active_support/core_ext'

#=nissen collect APIwrapper
module NissenCollect
  ROOT_HOST = 'collect-operation.nissen.co.jp'
  ROOT_URL = 'https://collect-operation.nissen.co.jp/'
  #REQUEST_BODY = YAML.load_file('./collect/body.yml')

  class Client

    #httpsリクエストの作成
    def request_setup target_host,params
      Proc.new do |req|
        req.body = params
        req.url target_host
      end

        # if params.delete(:bearer_token_request)
        #   request.headers[:authorization] = bearer_token_credentials_auth_header
        #   request.headers[:content_type] = 'application/x-www-form-urlencoded; charset=UTF-8'
        #   request.headers[:accept] = '*/*' # It is important we set this, otherwise we get an error.
        # elsif params.delete(:app_auth) || !user_token?
        #   unless bearer_token?
        #     @bearer_token = token
        #     Twitter.client.bearer_token = @bearer_token if Twitter.client?
        #   end
        #   request.headers[:authorization] = bearer_auth_header
        # else
        #   request.headers[:authorization] = oauth_auth_header(method, path, signature_params).to_s
        # end
    end

    def connection
      #@connection ||= Faraday.new(ROOT_URL, @connection_options.merge(:builder => @middleware))
      @connection = Faraday::Connection.new(ROOT_URL) do |builder|
        builder.use Faraday::Request::UrlEncoded  # リクエストパラメータを URL エンコードする
        builder.use Faraday::Response::Logger     # リクエストを標準出力に出力する
        builder.use Faraday::Adapter::NetHttp     # Net/HTTP をアダプターに使う
      end
    end

    #httpsリクエスト送信
    def request(method,target_host,params)
      request_setup = request_setup(target_host, params)
      connection.send(method.to_sym, &request_setup).env
      rescue Faraday::Error::ClientError
        raise Twitter::Error::ClientError
      rescue JSON::ParserError
        raise Twitter::Error::ParserError
    end

  end

end

