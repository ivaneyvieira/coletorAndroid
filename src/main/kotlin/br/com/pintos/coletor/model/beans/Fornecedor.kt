package br.com.pintos.coletor.model.beans

data class Fornecedor(var id: Long? = null,
                      var codigo: Int? = null,
                      var fantazia: String? = null,
                      var razao: String? = null,
                      var version: Int? = null)