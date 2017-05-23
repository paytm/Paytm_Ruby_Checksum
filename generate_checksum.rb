#!C:\Ruby21-x64\bin\ruby.exe
require './paytm/encryption_new_pg.rb'
require './paytm/checksum_tool.rb'
#require 'json'
#require 'cgi'
require 'uri'
#cgi = CGI.new
#params = cgi.params


puts "Content-type: text/html"
puts ""

paytmHASH = Hash.new

paytmHASH["MID"] = 'XXXXXXXXXX';  #Provided by Paytm
paytmHASH["ORDER_ID"] = 'ORDER0000001'; #unique OrderId for every request
paytmHASH["CUST_ID"] = 'CUST00001'; # unique customer identifier 
paytmHASH["INDUSTRY_TYPE_ID"] = 'XXXXXXXXX'; #Provided by Paytm  
paytmHASH["CHANNEL_ID"] = 'WAP'; #Provided by Paytm
paytmHASH["TXN_AMOUNT"] = '1.00'; #transaction amount
paytmHASH["WEBSITE"] = 'XXXXXXXXX'; #Provided by Paytm
paytmHASH["EMAIL"] = 'abc@gmail.com'; #customer email id
paytmHASH["MOBILE_NO"] = '9999999999'; #customer 10 digit mobile no.
paytmHASH["CALLBACK_URL"] = 'https://pguat.paytm.com/paytmchecksum/paytmCallback.jsp';  #Provided by Paytm

#paytmparamsnew = paytmHASH

checksum_hash = ChecksumTool.new.get_checksum_hash(paytmHASH).gsub("\n",'')

paytmHASH["CHECKSUMHASH"] =  checksum_hash

puts "#{paytmHASH}"
