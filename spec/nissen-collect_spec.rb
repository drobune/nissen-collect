require 'nissen-collect'
require 'spec_helper'

describe NissenCollect do

  it "should have a VERSION constant" do
    subject.const_get('VERSION').should_not be_empty
  end

  it "should have Hash constants" do
    ['HTTPINFO','BUYER','DELIVERIES','PDREQUEST','TRANSACTION'].map{ |constant|
    subject.const_get(constant).should_not be_empty}
  end




end
