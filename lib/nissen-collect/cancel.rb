# -*- encoding: utf-8 -*-
module NissenCollect

  class Cancel < Action
    attr_accessor :transaction
    @@transaction_path = 'direct/autocancel.do'

    # @bodyを初期化する
    # @param [Hash] body 生成時引数
    def initialize
      super
      @transaction = TRANSACTION
    end

    # APIコールを行う
    def call
      body = [@@shopInfo,@transaction].inject {|union,hash| union.merge hash}
      connect = NissenCollect::Client.new
      connect.request('get',@@transaction_path,body)
    end

  end

end
