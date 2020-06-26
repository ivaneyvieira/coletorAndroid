package br.com.pintos.coletor.model

import br.com.pintos.framework.model.QueryDB
import br.com.pintos.framework.util.DB

class QuerySaci: QueryDB(driver, url, username, password) {


  companion object {
    private val db = DB("saci")
    internal val driver = db.driver
    internal val url = db.url
    internal val username = db.username
    internal val password = db.password
    internal val test = db.test
    val ipServer =
      url.split("/")
        .getOrNull(2)
  }
}

val saci = QuerySaci()