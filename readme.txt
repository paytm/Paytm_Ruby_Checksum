Prerequisite
Provide the value for PAYTM_MERCHANT_KEY in /paytm/checksum_tool.rb file. 
PAYTM_MERCHANT_KEY = "";  (at line #4)
(The value for MERCHANT_KEY will be provided after the onboarding process is completed).
Installation steps
The generate_checksum.rb file uses the /paytm/checksum_tool.rb  file and provides the module to generate the checksum. Copy these files to the location on your server which will be used for the Checksum Generation URL.
The verify_checksum.rb file uses the /paytm/checksum_tool.rb  file and provides the module to verify the checksum. Copy these files to the location on your server which will be used for the Checksum Verify URL.
Copy the /paytm folder into the same directory as the generateChecksum.php and verifyChecksum.php.