package br.com.pintos.coletor.view

import com.github.mvysny.karibudsl.v10.KComposite
import com.github.mvysny.karibudsl.v10.appLayout
import com.github.mvysny.karibudsl.v10.content
import com.github.mvysny.karibudsl.v10.div
import com.github.mvysny.karibudsl.v10.h3
import com.github.mvysny.karibudsl.v10.navbar
import com.vaadin.flow.component.HasElement
import com.vaadin.flow.component.html.Div
import com.vaadin.flow.component.page.BodySize
import com.vaadin.flow.component.page.Viewport
import com.vaadin.flow.router.RouterLayout
import com.vaadin.flow.server.PWA
import com.vaadin.flow.theme.Theme
import com.vaadin.flow.theme.material.Material

@BodySize(width = "100vw", height = "100vh")
@Viewport("width=device-width, minimum-scale=1, initial-scale=1, user-scalable=yes")
@Theme(Material::class)
@PWA(name = "Coletor de inventário", shortName = "Coletor", iconPath = "icons/icon.png", enableInstallPrompt = false)
class MainLayout: KComposite(), RouterLayout {
  private lateinit var contentPane: Div
  private val root = ui {
    appLayout {
      isDrawerOpened = false
      
      navbar {
        h3("Coletor")
      }
      //drawer
      content {
        contentPane = div {
          setSizeFull()
          classNames.add("app-content")
        }
      }
    }
  }
  
  override fun showRouterLayoutContent(content: HasElement) {
    contentPane.element.appendChild(content.element)
  }
}