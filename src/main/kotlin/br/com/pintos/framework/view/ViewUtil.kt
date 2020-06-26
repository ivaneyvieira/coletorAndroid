package br.com.pintos.framework.view

import br.com.pintos.framework.util.SystemUtils

class ViewUtil {
  companion object{
    val versao : String
    get() {
      val arquivo = "/versao.txt"
      return SystemUtils.readFile(arquivo) ?: "1.0"
    }
  }
}