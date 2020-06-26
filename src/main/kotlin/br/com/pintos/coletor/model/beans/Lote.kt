package br.com.pintos.coletor.model.beans

data class Lote(var id: Long? = null,
                var descricao: String? = null,
                var loteavulso: Byte? = null,
                var numero: Int? = null,
                var lojaId: Long? = null,
                var version: Int? = null)