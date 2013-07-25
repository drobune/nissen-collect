# -*- encoding: utf-8 -*-
module NissenCollect

  class Transaction
    attr_accessor :body
    @@transaction_path = 'direct/autotransaction.do'

    def initialize body=nil#=REQUEST_BODY[:autotransaction])
      @body = body ? body |　SHOPINFO.merge(HTTPINFO,BUYER)
    end

    def call
      connect = NissenCollect::Client.new
      connect.request('get',@@transaction_path,@body)
    end

  end

end
