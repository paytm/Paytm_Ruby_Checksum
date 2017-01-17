#!C:\Ruby21-x64\bin\ruby.exe
require './paytm/encryption_new_pg.rb'
require './paytm/checksum_tool.rb'
require 'json'
require 'cgi'
require 'uri'
cgi = CGI.new
params = cgi.params


puts "Content-type: text/html"
puts ""

paytmHASH = Hash.new

paytmHASH["MID"] = '';
paytmHASH["ORDER_ID"] = '';
paytmHASH["CUST_ID"] = '';
paytmHASH["INDUSTRY_TYPE_ID"] = '';
paytmHASH["CHANNEL_ID"] = '';
paytmHASH["TXN_AMOUNT"] = '';
paytmHASH["WEBSITE"] = '';

keys = params.keys
keys.each do |k|
	if ! params[k].empty?
		paytmHASH[k] = params[k]
		if paytmHASH[k].to_s.include? "REFUND"
		    @x = 'true'
		    break
		end
	end
end
if @x == 'true'    
    paytmHASH.clear
    exit
end
mid = paytmHASH["MID"]
order_id = paytmHASH["ORDER_ID"]
checksum_hash = ChecksumTool.new.get_checksum_hash(paytmHASH).gsub("\n",'')

returnJson= Hash.new

returnJson["CHECKSUMHASH"] =  checksum_hash
returnJson["ORDER_ID"]     =  order_id
returnJson["payt_STATUS"]  =  1
puts "#{returnJson}"



