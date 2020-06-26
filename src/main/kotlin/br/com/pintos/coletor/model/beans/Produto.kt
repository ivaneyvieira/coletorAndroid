package br.com.pintos.coletor.model.beans

data class Produto(var id: Long? = null,
                   var barcode: String? = null,
                   var codigo: String? = null,
                   var descricao: String? = null,
                   var duplicado: Byte? = null,
                   var foralinha: Byte? = null,
                   var grade: String? = null,
                   var usoconsumo: Byte? = null,
                   var clId: Long? = null,
                   var fornecedorId: Long? = null,
                   var version: Int? = null)