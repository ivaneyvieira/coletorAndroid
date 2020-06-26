package br.com.pintos.coletor.model.beans

data class Usuario(var id: Long? = null,
                   var matricula: Int? = null,
                   var nome: String? = null,
                   var senha: String? = null,
                   var apelido: String? = null,
                   var version: Int? = null)