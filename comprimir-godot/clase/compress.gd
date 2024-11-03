extends Node
class_name compress
@export_enum("FASTLZ:0" ,"DEFLATE:1" ,"ZSTD:2", "GZIP:3" ) var MODE_COMPRESSION: int = 0


var string_length
var bytes
var comprimido

var descomprimido 
var cadena_decomprimida 

func _ready() -> void:
	var data = PackedByteArray()
	var mi_variable = 99
	var tipo = typeof(mi_variable)

	match tipo:
		TYPE_NIL: print("Es un nulo")
		TYPE_BOOL: print("Es un booleano")
		TYPE_INT: print("Es un entero")
		TYPE_FLOAT: prints("es un float")
		TYPE_STRING: print("Es una cadena")
		TYPE_VECTOR2: print("Es un Vector2")
		TYPE_MAX: prints("es un variant")
		TYPE_DICTIONARY: prints("es un dicionario")
		TYPE_PACKED_FLOAT32_ARRAY: prints("es un packetarray32float")
	# y así sucesivamente para 




func _process(delta: float) -> void:
	pass



func decompress(data , mode , size ) -> PackedByteArray:
	var array = PackedByteArray()
	
	var tipo = typeof(data)
	if tipo == TYPE_PACKED_BYTE_ARRAY:
		descomprimido = data.decompress(size, mode)
		cadena_decomprimida = descomprimido.get_string_from_utf8()
		prints("desde la clase ",descomprimido)
	else:
		prints("desde la clase no es un array")
		return array  
	return descomprimido



func compress(data , mode  ) -> PackedByteArray:
	var tipo = typeof(data)
	
	if tipo == TYPE_PACKED_BYTE_ARRAY:
		
		comprimido = data.compress(mode)
		
	
	if tipo == TYPE_STRING:
		bytes = data.to_utf8_buffer()
		comprimido = bytes.compress(mode)
	else:
		prints("desde la clase no es un array")
		return comprimido  
		
	return comprimido
	
