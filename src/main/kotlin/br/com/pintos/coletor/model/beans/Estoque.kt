package br.com.pintos.coletor.model.beans

data class Estoque(var id: Long? = null,
                   var quant: Int? = null,
                   var inventarioId: Long? = null,
                   var produtoId: Long? = null,
                   var version: Int? = null)