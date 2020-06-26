package br.com.pintos.coletor.model.beans

data class Coleta(var id: Long? = null,
                  var numleitura: Int? = null,
                  var inventarioId: Long? = null,
                  var loteId: Long? = null,
                  var usuarioId: Long? = null,
                  var coletor: Int? = null,
                  var status: String? = null,
                  var version: Int? = null)