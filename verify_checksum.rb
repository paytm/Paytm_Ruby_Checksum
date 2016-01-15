#!C:\Ruby21-x64\bin\ruby.exe
require './paytm/encryption_new_pg.rb'
require './paytm/checksum_tool.rb'
require 'json'
require 'cgi'

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

@encoded_json = CGI.escapeHTML(paytmHASH.to_json)

puts "<html><head><meta http-equiv=\"Content-Type\" content=\"text/html;charset=ISO-8859-I\"><title>Paytm</title><script type=\"text/javascript\">function response(){return document.getElementById('response').value;}</script></head><body>Redirect back to the app<br><form name=\"frm\" method=\"post\"><input type=\"hidden\" id=\"response\" name=\"responseField\" value='#{@encoded_json}'></form></body></html>" 