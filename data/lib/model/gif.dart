class Gif {
  final String url;

  Gif(this.url);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Gif && runtimeType == other.runtimeType && url == other.url;

  @override
  int get hashCode => url.hashCode;

  @override
  String toString() {
    return 'Gif{url: $url}';
  }
}
