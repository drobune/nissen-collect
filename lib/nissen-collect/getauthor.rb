# -*- encoding: utf-8 -*-
module NissenCollect

  class Getauthor < Action
    attr_accessor :transaction
    @@transaction_path = 'direct/autogetauthor.do'

    # @bodyを初期化する
    # @param [Hash] body 生成時引数
    def initialize
      super
      @transaction = Marshal.load(Marshal.dump(TRANSACTION))
    end

    # APIコールを行う
    def call
      body = [@@shopInfo,@transaction].inject {|union,hash| union.merge hash}
      connect = NissenCollect::Client.new
      connect.request('get',@@transaction_path,body)
    end

  end

end
