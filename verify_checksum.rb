#!C:\Ruby21-x64\bin\ruby.exe
require './paytm/encryption_new_pg.rb'
require './paytm/checksum_tool.rb'
#require 'json'
#require 'cgi'

cgi = CGI.new
params = cgi.params
puts "Content-type: text/html"
puts ""
paytmHASH = Hash.new

keys = params.keys
keys.each do |k|
		paytmHASH[k] = params[k]
end
paytmHASH = ChecksumTool.new.get_checksum_verified_array(paytmHASH)
# if checksum is validated Kindly verify the amount and status 
# if transaction is successful 
# kindly call Paytm Transaction Status API and verify the transaction amount and status.
# If everything is fine then mark that transaction as successful into your DB.
