class ChecksumTool
  include EncryptionNewPG
  
  PAYTM_MERCHANT_KEY = ""

  def self.is_valid_merchant_id?(mid)
    return mid.eql?(MID)
  end

  def get_checksum_hash(paytmparams)
    return new_pg_checksum(paytmparams, PAYTM_MERCHANT_KEY)
  end
  def get_checksum_verified_array(paytmparams)
    checksum_hash = paytmparams["CHECKSUMHASH"]
		paytmparams.delete("CHECKSUMHASH")
    return_array = paytmparams		
		
    return new_pg_verify_checksum(paytmparams, checksum_hash, PAYTM_MERCHANT_KEY)   
  end
end