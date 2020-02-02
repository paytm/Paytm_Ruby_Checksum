# More Details: https://developer.paytm.com/docs/checksum/#ruby
require './PaytmChecksum.rb'

# Generate Checksum via Array
# initialize an array
paytmParams = Hash.new

paytmParams["MID"] = "YOUR_MID_HERE"
paytmParams["ORDERID"] = "YOUR_ORDER_ID_HERE"

# Generate checksum by parameters we have
# Find your Merchant Key in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys

paytmChecksum = PaytmChecksum.new.generateSignature(paytmParams, "YOUR_KEY_HERE")
verifyChecksum = PaytmChecksum.new.verifySignature(paytmParams, "YOUR_KEY_HERE", paytmChecksum)

puts "generateSignature Returns: %s\n" %[paytmChecksum]
puts "verifySignature Returns: %s\n\n" %[verifyChecksum]

# Generate Checksum via String
# initialize JSON String
body = "{\"mid\":\"YOUR_MID_HERE\",\"orderId\":\"YOUR_ORDER_ID_HERE\"}"

# Generate checksum by parameters we have
# Find your Merchant Key in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys

paytmChecksum = PaytmChecksum.new.generateSignature(body, "YOUR_KEY_HERE")
verifyChecksum = PaytmChecksum.new.verifySignature(body, "YOUR_KEY_HERE", paytmChecksum)

puts "generateSignature Returns: %s\n" %[paytmChecksum]
puts "verifySignature Returns: %s\n" %[verifyChecksum]