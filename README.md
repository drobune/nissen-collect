###  nissen スマート接続 API wrapper
ニッセン社の後払いサービス「@後払い」をスマート接続APIから利用するためのラッパーです。

[link;  rubygems](https://rubygems.org/gems/nissen-collect)

[link;  travis](https://travis-ci.org/yu1ch1/nissen-collect)

[link;  gemasium](https://gemnasium.com/gems/nissen-collect)

[link;  nissen](http://collect.nissen.co.jp/atobarai-ec/)

[link;  php module@nissen](http://www.ec-cube.net/products/detail.php?product_id=371)

### Installation　導入
    gem install nissen-collect

### Configuration　設定
nissen-collect requires you to authenticate via https.
So, you'll need to configure enviroment varuables.

ニッセン社より付与されたID,PASSを環境変数に設定してください。

```ruby
ENV['NISSEN_COLLECT_SHOPCODE'] = #shopCode from nissen
ENV['NISSEN_COLLECT_PASSWORD'] = #shopPassword from nissen
ENV['NISSEN_COLLECT_TERMINALID'] = #terminalId: from nissen
```

### Usage 使用法
Next 5 APIs can call.(only production server@nissen)

次の5個のAPIを叩けます。

* Transaction（注文情報登録）

```ruby
request = NissenCollect:Transaction.new
request.body
=> {"shopInfo"=>{"shopCode"=> , "shopPassword"=> , "terminalId"=> },
 "httpInfo"=>{"httpHeader"=> , "deviceInfo"=> },
 "buyer"=>
  {"shopTransactionId"=> ,
   "shopOrderDate"=> ,
   "fullName"=> ,
   "firstName"=> ,
   "lastName"=> ,
   "fullKanaName"=> ,
   "firstKanaName"=> ,
   "lastKanaName"=> ,
   "tel"=> ,
   "mobile"=> ,
   "email"=> ,
   "mobileEmail"=> ,
   "zipCode"=> ,
   "address1"=> ,
   "address2"=> ,
   "address3"=> ,
   "companyName"=> ,
   "departmentName"=> ,
   "billedAmount"=> ,
   "paymentType"=> },
 "deliveries"=>
  {"delivery"=>
    {"deliveryCustomer"=> ,
     "fullName"=> ,
     "firstName"=> ,
     "lastName"=> ,
     "fullKanaName"=> ,
     "firstKanaName"=> ,
     "lastKanaName"=> ,
     "zipCode"=> ,
     "address1"=> ,
     "address2"=> ,
     "address3"=> ,
     "companyName"=> ,
     "departmentName"=> ,
     "tel"=> ,
     "email"=> },
   "details"=>
    {"detail"=>{"detailId"=> , "detailName"=> , "detailQuantity"=> }}}
}

request.call
```

* Getauthor(与信結果取得)

```ruby
request = NissenCollect::Getauthor.new

request.body
=> {"shopInfo"=>{"shopCode"=> , "shopPassword"=> , "terminalId"=> },
 "buyer"=>
  {"shopTransactionId"=> ,
   "shopOrderDate"=> ,
   "fullName"=> ,
   "firstName"=> ,
   "lastName"=> ,
   "fullKanaName"=> ,
   "firstKanaName"=> ,
   "lastKanaName"=> ,
   "tel"=> ,
   "mobile"=> ,
   "email"=> ,
   "mobileEmail"=> ,
   "zipCode"=> ,
   "address1"=> ,
   "address2"=> ,
   "address3"=> ,
   "companyName"=> ,
   "departmentName"=> ,
   "billedAmount"=> ,
   "paymentType"=> }}

request.call
```

* Modifytransaction（注文情報修正）

```ruby
request = NissenCollect::Modifytransaction.new

request.body
=> {"shopInfo"=>{"shopCode"=> , "shopPassword"=> , "terminalId"=> },
 "buyer"=>
  {"shopTransactionId"=> ,
   "shopOrderDate"=> ,
   "fullName"=> ,
   "firstName"=> ,
   "lastName"=> ,
   "fullKanaName"=> ,
   "firstKanaName"=> ,
   "lastKanaName"=> ,
   "tel"=> ,
   "mobile"=> ,
   "email"=> ,
   "mobileEmail"=> ,
   "zipCode"=> ,
   "address1"=> ,
   "address2"=> ,
   "address3"=> ,
   "companyName"=> ,
   "departmentName"=> ,
   "billedAmount"=> ,
   "paymentType"=> },
 "deliveries"=>
  {"delivery"=>
    {"deliveryCustomer"=> ,
     "fullName"=> ,
     "firstName"=> ,
     "lastName"=> ,
     "fullKanaName"=> ,
     "firstKanaName"=> ,
     "lastKanaName"=> ,
     "zipCode"=> ,
     "address1"=> ,
     "address2"=> ,
     "address3"=> ,
     "companyName"=> ,
     "departmentName"=> ,
     "tel"=> ,
     "email"=> },
   "details"=>
    {"detail"=>{"detailId"=> , "detailName"=> , "detailQuantity"=> }}}}

request.call
```

* Pdrequest（発送情報登録）

```ruby
request = NissenCollect::Pdrequest.new

request.body
=> {"shopInfo"=>{"shopCode"=> , "shopPassword"=> , "terminalId"=> },
 "transaction"=>
  {"nissenTransactionId"=> , "shopTransactionId"=> , "billedAmount"=> },
 "PdRequest"=>
  {"pdcompanycode"=> ,
   "slipno"=> ,
   "address1"=> ,
   "address2"=> ,
   "address3"=> }}

request.call
```

* Cancel(キャンセル登録)

```ruby
request = NissenCollect::Cancel.new

request.body
=> {"shopInfo"=>{"shopCode"=> , "shopPassword"=> , "terminalId"=> },
 "transaction"=>
  {"nissenTransactionId"=> , "shopTransactionId"=> , "billedAmount"=> }}

request.call
```

### Copyright
Copyright (c) 2013 Yuichi Sano.
See [LICENSE][] for details.

[license]: LICENSE.md
