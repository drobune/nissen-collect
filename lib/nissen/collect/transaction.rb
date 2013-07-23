# -*- encoding: utf-8 -*-
module NissenCollect

  class Transaction
    #TRANSACTION_URL = 'https://collect-operation.nissen.co.jp/direct/autotransaction.do'
    TRANSACTION = 'direct/autotransaction.do'

    def call
      connect = NissenCollect::Client.new
      connect.request(get)
    end

  end

end
