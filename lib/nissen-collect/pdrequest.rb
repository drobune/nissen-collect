# -*- encoding: utf-8 -*-
module NissenCollect

  class Pdrequest < Action
    attr_accessor :transaction,:pdrequest
    @@transaction_path = 'direct/autotransaction.do'

    # @bodyを初期化する
    # @param [Hash] body 生成時引数
    def initialize
      super
      @transaction = TRANSACTION
      @pdrequest = PDREQUEST
    end

    # APIコールを行う
    def call
      body = [@@shopInfo,@transaction,@pdrequest].inject {|union,hash| union.merge hash}
      connect = NissenCollect::Client.new
      connect.request('get',@@transaction_path,body)
    end

  end

end
