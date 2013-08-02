# -*- encoding: utf-8 -*-
module NissenCollect

  class Modifytransaction < Action
    attr_accessor :buyer,:deliveries
    @@transaction_path = 'direct/automodifytransaction.do'

    # @bodyを初期化する
    # @param [Hash] body 生成時引数
    def initialize
      super
      @buyer = BUYER
      @deliveries = DELIVERIES
    end

    # APIコールを行う
    def call
      body = [@@shopInfo,@buyer,@deliveries].inject {|union,hash| union.merge hash}
      connect = NissenCollect::Client.new
      connect.request('get',@@transaction_path,body)
    end

  end

end
