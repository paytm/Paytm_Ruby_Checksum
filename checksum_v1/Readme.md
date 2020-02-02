# Prerequisite
Provide the value for PAYTM_MERCHANT_KEY in /paytm/checksum_tool.rb file as per the code snippet given below:
 - PAYTM_MERCHANT_KEY = "";  (at line #4)

NOTE: The value for MERCHANT_KEY will be provided by Paytm after the onboarding process is completed.

# Installation steps
1. The generate_checksum.rb file uses the /paytm/checksum_tool.rb  file and provides the module to generate the checksum. Copy this file to the location on your server which will be used for the Checksum Generation URL.
2. The verify_checksum.rb file uses the /paytm/checksum_tool.rb  file and provides the module to verify the checksum. Copy this file to the location on your server which will be used for the Checksum Verify URL.
3. Copy the /paytm folder into the same directory as the generate_checksum.rb and verify_checksum.rb files.
