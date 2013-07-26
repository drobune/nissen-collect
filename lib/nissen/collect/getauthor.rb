# -*- encoding: utf-8 -*-
module NissenCollect

  class Transaction
    attr_accessor :body
    @@transaction_path = 'direct/autotransaction.do'

    def initialize body=nil
      @body = body ? body : [SHOPINFO,HTTPINFO,BUYER,DELIVERIES].inject {|union,hash| union.merge hash}
    end

    def call
      connect = NissenCollect::Client.new
      connect.request('get',@@transaction_path,@body.to_xml)
    end

  end

end
