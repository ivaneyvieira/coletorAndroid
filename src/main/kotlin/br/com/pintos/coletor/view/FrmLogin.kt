package br.com.pintos.coletor.view

import com.github.mvysny.karibudsl.v10.button
import com.github.mvysny.karibudsl.v10.formLayout
import com.github.mvysny.karibudsl.v10.integerField
import com.github.mvysny.karibudsl.v10.textField
import com.vaadin.flow.component.button.ButtonVariant.MATERIAL_CONTAINED
import com.vaadin.flow.component.orderedlayout.VerticalLayout
import com.vaadin.flow.component.textfield.IntegerField
import com.vaadin.flow.component.textfield.TextField
import com.vaadin.flow.router.PageTitle
import com.vaadin.flow.router.Route

@Route(layout = MainLayout::class, value = "")
@PageTitle("Login")
class FrmLogin: VerticalLayout() {
  private lateinit var edtNome: TextField
  private lateinit var edtMatricula: IntegerField
  
  init {
    formLayout {
      edtMatricula = integerField("Matrícula")
      edtNome = textField("Nome:") {
        isEnabled = false
      }
    }
    button("Acessar Inventário") {
      addThemeVariants(MATERIAL_CONTAINED)
    }
  }
}