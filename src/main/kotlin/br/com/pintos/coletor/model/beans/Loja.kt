package br.com.pintos.coletor.model.beans

data class Loja(var id: Long? = null,
                var endereco: String? = null,
                var nome: String? = null,
                var sigla: String? = null,
                var storeno: Int? = null,
                var version: Int? = null)