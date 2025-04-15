require 'dotenv/load'
require 'awesome_print'
require 'netsuite'

class Object
  def blank? = respond_to?(:empty?) ? !!empty? : !self
end

NetSuite.configure do
  reset!

  account ENV['NETSUITE_ACCOUNT']
  consumer_key ENV['NETSUITE_CONSUMER_KEY']
  consumer_secret ENV['NETSUITE_CONSUMER_SECRET']
  token_id ENV['NETSUITE_TOKEN_ID']
  token_secret ENV['NETSUITE_TOKEN_SECRET']

  # oauth does not work with API versions less than 2015_2
  api_version '2024_2' # https://docs.oracle.com/en/cloud/saas/netsuite/ns-online-help/section_N3418621.

  # wsdl "https://webservices.netsuite.com/wsdl/v#{api_version}/netsuite.wsdl"
  wsdl_domain "#{account}.suitetalk.api.netsuite.com"

  # the endpoint indicated in the > 2018_2 WSDL is invalid
  # you must set the endpoint directly
  # https://github.com/NetSweet/netsuite/pull/473
  endpoint "https://#{wsdl_domain}/services/NetSuitePort_#{api_version}"
end

ap NetSuite::Configuration.attributes

bill = NetSuite::Records::VendorBill.new(entity: { internal_id: 975 }, location: { internal_id: 2 })
expense_list = NetSuite::Records::VendorBillExpenseList.new
expense = NetSuite::Records::VendorBillExpense.new({ account: { internal_id: 140 }, amount: 110.0, memo: "test" })

ap expense_list

expense_list.expenses << expense
bill.expense_list = expense_list

ap bill.add