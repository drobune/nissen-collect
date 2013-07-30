# nissen-collect Ruby Gem

[gem]: https://rubygems.org/gems/nissen-collect
[travis]: https://travis-ci.org/yu1ch1/nissen-collect

##  nissen スマート接続 API wrapper
概要はニッセン社のドキュメントを参照してください。
[nissen]: http://collect.nissen.co.jp/atobarai-ec/
[php module@nissen]: http://www.ec-cube.net/products/detail.php?product_id=371

## Installation　導入
    gem install nissen-collect

## Configuration　設定
nissen-collect requires you to authenticate via https.
So, you'll need to configure enviroment varuables.

ニッセン社より付与されたID,PASSを環境変数に設定してください。

'''ruby
ENV['NISSEN_COLLECT_SHOPCODE'] = #shopCode from nissen
ENV['NISSEN_COLLECT_PASSWORD'] = #shopPassword from nissen
ENV['NISSEN_COLLECT_TERMINALID'] = #terminalId: from nissen
'''

##　Usage 使用法
Next 5 APIs can call.(only production server@nissen)
次の5個のAPIを叩けます。

* Transaction（注文情報登録）

```ruby
request = NissenCollect:Transaction.new
request.body
=> {"shopInfo"=>{"shopCode"=>nil, "shopPassword"=>nil, "terminalId"=>nil},
 "httpInfo"=>{"httpHeader"=>nil, "deviceInfo"=>nil},
 "buyer"=>
  {"shopTransactionId"=>nil,
   "shopOrderDate"=>nil,
   "fullName"=>nil,
   "firstName"=>nil,
   "lastName"=>nil,
   "fullKanaName"=>nil,
   "firstKanaName"=>nil,
   "lastKanaName"=>nil,
   "tel"=>nil,
   "mobile"=>nil,
   "email"=>nil,
   "mobileEmail"=>nil,
   "zipCode"=>nil,
   "address1"=>nil,
   "address2"=>nil,
   "address3"=>nil,
   "companyName"=>nil,
   "departmentName"=>nil,
   "billedAmount"=>nil,
   "paymentType"=>nil},
 "deliveries"=>
  {"delivery"=>
    {"deliveryCustomer"=>nil,
     "fullName"=>nil,
     "firstName"=>nil,
     "lastName"=>nil,
     "fullKanaName"=>nil,
     "firstKanaName"=>nil,
     "lastKanaName"=>nil,
     "zipCode"=>nil,
     "address1"=>nil,
     "address2"=>nil,
     "address3"=>nil,
     "companyName"=>nil,
     "departmentName"=>nil,
     "tel"=>nil,
     "email"=>nil},
   "details"=>
    {"detail"=>{"detailId"=>nil, "detailName"=>nil, "detailQuantity"=>nil}}}
}

request.call
```

* Getauthor(与信結果取得)

```ruby
request = NissenCollect::Getauthor.new

request.body
=> {"shopInfo"=>{"shopCode"=>nil, "shopPassword"=>nil, "terminalId"=>nil},
 "buyer"=>
  {"shopTransactionId"=>nil,
   "shopOrderDate"=>nil,
   "fullName"=>nil,
   "firstName"=>nil,
   "lastName"=>nil,
   "fullKanaName"=>nil,
   "firstKanaName"=>nil,
   "lastKanaName"=>nil,
   "tel"=>nil,
   "mobile"=>nil,
   "email"=>nil,
   "mobileEmail"=>nil,
   "zipCode"=>nil,
   "address1"=>nil,
   "address2"=>nil,
   "address3"=>nil,
   "companyName"=>nil,
   "departmentName"=>nil,
   "billedAmount"=>nil,
   "paymentType"=>nil}}

request.call
```

* Modifytransaction（注文情報修正）

```ruby
request = NissenCollect::Modifytransaction.new

request.body
=> {"shopInfo"=>{"shopCode"=>nil, "shopPassword"=>nil, "terminalId"=>nil},
 "buyer"=>
  {"shopTransactionId"=>nil,
   "shopOrderDate"=>nil,
   "fullName"=>nil,
   "firstName"=>nil,
   "lastName"=>nil,
   "fullKanaName"=>nil,
   "firstKanaName"=>nil,
   "lastKanaName"=>nil,
   "tel"=>nil,
   "mobile"=>nil,
   "email"=>nil,
   "mobileEmail"=>nil,
   "zipCode"=>nil,
   "address1"=>nil,
   "address2"=>nil,
   "address3"=>nil,
   "companyName"=>nil,
   "departmentName"=>nil,
   "billedAmount"=>nil,
   "paymentType"=>nil},
 "deliveries"=>
  {"delivery"=>
    {"deliveryCustomer"=>nil,
     "fullName"=>nil,
     "firstName"=>nil,
     "lastName"=>nil,
     "fullKanaName"=>nil,
     "firstKanaName"=>nil,
     "lastKanaName"=>nil,
     "zipCode"=>nil,
     "address1"=>nil,
     "address2"=>nil,
     "address3"=>nil,
     "companyName"=>nil,
     "departmentName"=>nil,
     "tel"=>nil,
     "email"=>nil},
   "details"=>
    {"detail"=>{"detailId"=>nil, "detailName"=>nil, "detailQuantity"=>nil}}}}

request.call
```

* Pdrequest（発送情報登録）

```ruby
request = NissenCollect::Pdrequest.new

request.body
=> {"shopInfo"=>{"shopCode"=>nil, "shopPassword"=>nil, "terminalId"=>nil},
 "transaction"=>
  {"nissenTransactionId"=>nil, "shopTransactionId"=>nil, "billedAmount"=>nil},
 "PdRequest"=>
  {"pdcompanycode"=>nil,
   "slipno"=>nil,
   "address1"=>nil,
   "address2"=>nil,
   "address3"=>nil}}

request.call

```

* Cancel(キャンセル登録)

```ruby
request = NissenCollect::Cancel.new

request.body
=> {"shopInfo"=>{"shopCode"=>nil, "shopPassword"=>nil, "terminalId"=>nil},
 "transaction"=>
  {"nissenTransactionId"=>nil, "shopTransactionId"=>nil, "billedAmount"=>nil}}

request.call
```
## Copyright
Copyright (c) 2013 Yuichi Sano.
See [LICENSE][] for details.

[license]: LICENSE.md
