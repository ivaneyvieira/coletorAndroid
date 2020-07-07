class ViewException implements Exception {
  final String errorMsg;

  ViewException(this.errorMsg);

  String toString() {
    if (errorMsg == null) return "Erro não identificado";
    return "$errorMsg";
  }

  factory ViewException.fail(List<String> messages) {
    if (messages.isNotEmpty)
      throw ViewException(messages.join("\n"));
    else
      return null;
  }
}
