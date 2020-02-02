# Paytm uses checksum signature to ensure that API requests and responses shared between your 
# application and Paytm over network have not been tampered with. We use SHA256 hashing and 
# AES128 encryption algorithm to ensure the safety of transaction data.
#
# @author     Lalit Kumar
# @version    2.0
# @link       https://developer.paytm.com/docs/checksum/#ruby

class PaytmChecksum

  require 'openssl'
  require 'base64'
  require 'digest'
  require 'securerandom'

  @@iv = '@@@@&&&&####$$$$'

  def encrypt(input, key)
    aes = OpenSSL::Cipher::AES.new('128-CBC')
    aes.encrypt
    aes.key = key
    aes.iv = @@iv
    data = nil
    begin
      data = aes.update(input.to_s) + aes.final
      data = Base64.encode64(data).gsub("\r\n",'').gsub("\n",'')
    rescue Exception => e
      return false
    end
    return data
  end

  def decrypt(encrypted, key) 
    data = nil
    aes = OpenSSL::Cipher::AES.new('128-CBC')
    begin
	    aes.decrypt
	    aes.key = key
	    aes.iv = @@iv
	    encrypted = Base64.decode64(encrypted)
	    data = aes.update(encrypted) + aes.final
    rescue Exception => e
      return false
    end
    return data
  end

  def generateSignature(params, key)   
    if !params.is_a?(Hash) and !params.is_a?(String) 
      raise "string or hash expected, " + params.class.to_s + " given"
    end
    if params.is_a?(Hash)
      params = getStringByParams(params)
    end
    return generateSignatureByString(params,key)
  end

  def verifySignature(params, key, checksum)
    if !params.is_a?(Hash) and !params.is_a?(String) 
      raise "string or hash expected, " + params.class.to_s + " given"
    end
    if params.is_a?(Hash) 
      params = getStringByParams(params)
    end
    return verifySignatureByString(params,key,checksum)
  end

  private
  def generateSignatureByString(params, key)  
    salt = generateRandomString(4)
    return calculateChecksum(params, key, salt)
  end

  private
  def verifySignatureByString(params, key, checksum)  
    paytm_hash = decrypt(checksum, key)
    salt = paytm_hash[(paytm_hash.length-4), (paytm_hash.length)]
    return paytm_hash == calculateHash(params, salt)
  end

  private
  def generateRandomString(length)
    salt = SecureRandom.urlsafe_base64(length*(3.0/4.0))
    return salt.to_s
  end

  private
  def getStringByParams(params)
    params = Hash[ params.sort_by { |key, val| key.to_s } ] 
    return params.values.join("|")
  end

  private
  def calculateHash(params, salt)
    finalString = params + '|' + salt
    hashString = Digest::SHA256.hexdigest(finalString)
    return hashString + salt
  end

  private
  def calculateChecksum(params, key, salt)
    hashString = calculateHash(params, salt)
    return encrypt(hashString, key)
  end
end