package br.com.pintos.framework.viewmodel

abstract class EViewModel(msg: String): Exception(msg)

class EViewModelFail(msg: String): EViewModel(msg)

