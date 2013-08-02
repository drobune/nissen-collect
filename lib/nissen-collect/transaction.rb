# -*- encoding: utf-8 -*-
module NissenCollect

  class Transaction < Action
    attr_accessor :httpInfo,:buyer,:deliveries
    @@transaction_path = 'direct/autotransaction.do'

    # @bodyを初期化する
    # @param [Hash] body 生成時引数
    def initialize
      super
      @httpInfo = HTTPINFO
      @buyer = BUYER
      @deliveries = DELIVERIES
    end

    # APIコールを行う
    def call
      body = [@@shopInfo,@httpInfo,@buyer,@deliveries].inject {|union,hash| union.merge hash}
      connect = NissenCollect::Client.new
      connect.request('get',@@transaction_path,body)
    end

  end

end
