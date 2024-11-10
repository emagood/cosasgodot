extends Node




var aes = AESContext.new()

func _ready():
	var key = "My secret key!!!" # Key must be either 16 or 32 bytes.
	var data = "My secret text!!" # Data size must be multiple of 16 bytes, apply padding if needed.
	# Encrypt ECB
	aes.start(AESContext.MODE_ECB_ENCRYPT, key.to_utf8_buffer())
	var encrypted = aes.update(data.to_utf8_buffer())
	prints(encrypted , "  encripted data ecb")
	aes.finish()
	# Decrypt ECB
	aes.start(AESContext.MODE_ECB_DECRYPT, key.to_utf8_buffer())
	var decrypted = aes.update(encrypted)
	prints(decrypted.get_string_from_utf8() , "   decripted data ecb")
	aes.finish()
	# Check ECB
	assert(decrypted == data.to_utf8_buffer())

	var iv = "My secret iv!!!!" # IV must be of exactly 16 bytes.
	# Encrypt CBC
	aes.start(AESContext.MODE_CBC_ENCRYPT, key.to_utf8_buffer(), iv.to_utf8_buffer())
	encrypted = aes.update(data.to_utf8_buffer())
	prints(encrypted , "  encripted data cbc")
	aes.finish()
	# Decrypt CBC
	aes.start(AESContext.MODE_CBC_DECRYPT, key.to_utf8_buffer(), iv.to_utf8_buffer())
	decrypted = aes.update(encrypted)
	prints(decrypted , "   decripted data cbc")
	aes.finish()
	# Check CBC
	assert(decrypted == data.to_utf8_buffer())
	
	
	
	
	pass # Replace with function body.
