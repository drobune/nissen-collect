$:.unshift File.dirname(__FILE__)
#require 'nissen/collect/version'
require 'collect/version'
require 'yaml'
require 'faraday'
require 'active-support/core_ext'

#=nissen collect APIwrapper
module NissenCollect
  ROOT_HOST = 'collect-operation.nissen.co.jp'
  ROOT_URL = 'https://collect-operation.nissen.co.jp/'
  REQUEST_BODY = YAML.load_file('./collect/body.yml')

  class Client

    #httpsリクエストの作成
    def request_setup
      body_xml = body
      Proc.new do |req|



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
    end

    def connection
      @connection ||= Faraday.new(@endpoint, @connection_options.merge(:builder => @middleware))

    #httpsリクエスト送信
    def request(method,path,params,signature)
      request_setup = request_setup(method, path, params, signature_params)
      connection.send(method.to_sym, path, params, &request_setup).env
      rescue Faraday::Error::ClientError
        raise Twitter::Error::ClientError
      rescue JSON::ParserError
        raise Twitter::Error::ParserError
    end

    #error
    def seterror
    end
  end

end

