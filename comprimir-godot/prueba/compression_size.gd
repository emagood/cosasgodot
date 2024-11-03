extends Control


@export_enum("YES_ARRAY:0", "NOT_NADA:1") var PRUEBA: int = 0
@export_enum("DEFLATE:1", "GZIP:3") var MODE_COMPRESSION: int = 1

var cadena = "dde las manzanas nace fruta verde y rojaeu"
var string_length
var bytes
var bite: PackedFloat32Array
var bite2: PackedByteArray


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# tu cadena

	string_length = cadena.length()
	bite2 = bite.to_byte_array()

	prints(bite2, "bite 2 nulo sin nada ")

# obtener matriz de bytes
	bite2 = cadena.to_utf8_buffer()
	#var ir = bite2.size() / 4
	#bite2.resize(ir)
	bite = bite2.to_float32_array()# no use anda mal
	prints(bite, "prins bite con datos de bite2 prueva 1")
	var bitearr: Array = Array(bite2)
	bite = PackedFloat32Array(bitearr)
	prints(bite, "prins bite con datos de bite2 desde array a array32float prueva 2")
	bite2 = PackedByteArray(bitearr)
	prints(bite2, "prins bite2 packarray de un array prueva 3")
	bite2 = bite.to_byte_array()
	prints(bite2, "prueba packarray de un packarray32float")
	bitearr = Array(bite)
	prints(bitearr, "prueba array de un packarray32float")
	bitearr = Array(bite)


	prints("size array ", bite2.size())
	prints(bite2, "bite 2 luego de asignar string")
	bytes = cadena.to_utf8_buffer()
	prints(bytes, "prints de bytes con string para comparara")



	if PRUEBA == 0:
		for i in bytes:
			prints(i)


# compresión, usando Deflate
	var comprimido = bytes.compress(MODE_COMPRESSION)
	prints(comprimido.size(), " uanto pesa comprimido")
	prints(string_length, " uanto pesa sin comprimir")
	prints(comprimido, " dato comprimido brutioo")

# descompresión usando Deflate, con longitud de salida conocida
	var descomprimido = comprimido.decompress(string_length, MODE_COMPRESSION)
	var cadena_decomprimida = descomprimido.get_string_from_utf8()
	prints(cadena_decomprimida, "  no dinamio on get string")

# descompresión mediante Deflate, con longitud de salida desconocida
	var decomp_dynamic = comprimido.decompress_dynamic(-1, MODE_COMPRESSION)
	cadena_decomprimida = decomp_dynamic.get_string_from_utf8()
	prints(decomp_dynamic, " dinamico sin getstring")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
