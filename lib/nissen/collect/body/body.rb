# -*- encoding: utf-8 -*-

# module NissenCollect

  # リクエストボディ
  # class Body

    # オブジェクトのxmlパラメータに変換する
    # @param [hash] body bodyを継承しているインスタンス
    # @return [xml] '' xml
    #def convert_to_xml body
      #obj_json = JSON.load(obj.to_json) #fix_me! 一度jsonにしてからhashにしています
      #return obj_json.to_xml(root:obj.convert_class_name)
    #end

    # 自身のクラス名の最初に一文字を小文字にして返す
    # @return type:string
    #private
  #   def convert_class_name
  #     classname = self.class.to_s
  #     first = classname[0].downcase!
  #     classname.slice!(0)
  #     return first + classname
  #   end

  #   class ShopInfo
  #     attr_reader :shopCode,:shopPassword,:terminalId
  #     def initialize
  #       @shopCode = ENV['NISSEN_COLLECT_SHOPCODE']
  #       @shopPassword = ENV['NISSEN_COLLECT_PASSWORD']
  #       @terminalId = ENV['NISSEN_COLLECT_TERMINALID']
  #     end
  #   end

  #   class HttpInfo
  #     attr_accessor :httpHeader, :deviceInfo
  #   end

  #   class Buyer
  #     attr_accessor :shopTransactionId,:shopOrderDate,:fullName,:firstName,
  #       :lastName,:fullKanaName,:firstKanaName,:lastKanaName,:tel,:mobile,
  #       :email,:mobileEmail,:zipCode,:address1,:address2,:address3,
  #       :companyName,:departmentName,:billedAmount,:paymentType
  #   end

  #   class Delivery
  #     def deliveryCustomer
  #       @deliveryCustomer
  #       def test
  #         @test = ''
  #       end
  #       #deliveryCustomer = DeliveryCustomer.new
  #     end
  #     class DeliveryCustomer
  #     attr_accessor :deliveryCustomer,:fullName,:firstName,:lastName,:fullKanaName,
  #       :firstKanaName,:lastKanaName,:zipCode,:address1,:address2,:address3,
  #       :companyName,:departmentName,:tel,:email
  #     end
  #   end

  #   class Detail
  #     attr_accessor :detailId,:detailName,:detailName,:detailQuantity
  #   end

  #   class Transaction
  #     attr_accessor :nissenTransactionId,:shopTransactionId,:billedAmount,:invoiceStartDate
  #   end

  #   class PdRequest
  #     attr_accessor :pdcompanycode,:slipno,:address1,:address2,:address3
  #   end
  # end

# end