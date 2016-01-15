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

keys = params.keys
keys.each do |k|
	if ! params[k].empty?
		paytmHASH[k] = params[k]
	end
end
mid = paytmHASH["MID"]
order_id = paytmHASH["ORDER_ID"]
checksum_hash = ChecksumTool.new.get_checksum_hash(paytmHASH).gsub("\n",'')

returnJson= Hash.new

returnJson["CHECKSUMHASH"] =  checksum_hash
returnJson["ORDER_ID"]     =  order_id
returnJson["payt_STATUS"]  =  1
puts "#{returnJson}"



