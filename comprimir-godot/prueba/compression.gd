extends Control


@export_enum("YES_ARRAY:0", "NOT_NADA:1") var PRUEBA: int = 0

@export_enum("FASTLZ:0", "DEFLATE:1", "ZSTD:2", "GZIP:3" ) var MODE_COMPRESSION: int = 0# Called when the node enters the scene tree for the first time.
var cadena = "prueba12hfgbhhyghkghnjkmkbgfyjknhhhjnh"
var string_length
var bytes


func _ready() -> void:
	# tu cadena

	string_length = cadena.length()

# obtener matriz de bytes
	bytes = cadena.to_utf8_buffer()
	prints(bytes.size(), string_length, "prueba")
	if PRUEBA == 0:
		for i in bytes:
			prints(i)

# compresión, usando Deflate
	var comprimido = bytes.compress(MODE_COMPRESSION)
	prints(comprimido.size(), "comprimido")
	prints(string_length)
	if PRUEBA == 0:
		for i in bytes:
			prints(i)
# descompresión usando Deflate, con longitud de salida conocida


	var cl = compress.new()
	prints(cl.decompress(comprimido, 0, string_length ))
	prints(cl.compress(cadena, 0))



	var descomprimido = comprimido.decompress(string_length, MODE_COMPRESSION)
	var cadena_decomprimida = descomprimido.get_string_from_utf8()
	prints(cadena_decomprimida)

## descompresión mediante Deflate, con longitud de salida desconocida
	#var decomp_dynamic = comprimido.decompress_dynamic(-1, MODE_COMPRESSION)
	#cadena_decomprimida = decomp_dynamic.get_string_from_utf8()
	#prints(cadena_decomprimida)
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
