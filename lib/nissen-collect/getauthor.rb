# -*- encoding: utf-8 -*-
module NissenCollect

  class Getauthor < Action
    attr_accessor :body
    @@transaction_path = 'direct/autogetauthor.do'

    # @bodyを初期化する
    # @param [Hash] body 生成時引数
    def initialize body=nil
      super()
      @body = body ? body : [@@shopInfo,BUYER].inject {|union,hash| union.merge hash}
    end

    # APIコールを行う
    def call
      connect = NissenCollect::Client.new
      connect.request('get',@@transaction_path,@body)
    end

  end

end
