# -*- encoding: utf-8 -*-
module NissenCollect

  class Getauthor
    attr_accessor :body
    @@transaction_path = 'direct/autogetauthor.do'

    # @bodyを初期化する
    # @param [Hash] body 生成時引数
    def initialize body=nil
      @body = body ? body : [SHOPINFO,BUYER].inject {|union,hash| union.merge hash}
    end

    # APIコールを行う
    def call
      connect = NissenCollect::Client.new
      connect.request('get',@@transaction_path,@body)
    end

  end

end
