module NissenCollect
    class Buyer
      attr_accessor :shopTransactionId,:shopOrderDate,:fullName,:firstName,
        :lastName,:fullKanaName,:firstKanaName,:lastKanaName,:tel,:mobile,
        :email,:mobileEmail,:zipCode,:address1,:address2,:address3,
        :companyName,:departmentName,:billedAmount,:paymentType
    end
end
