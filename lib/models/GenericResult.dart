class GenericResult<T> {
  final T data;
  final List<String> erros;

  GenericResult(this.erros, this.data);
}
