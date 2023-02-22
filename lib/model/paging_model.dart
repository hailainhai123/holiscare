class Paging<T> {
  int? pageIndex;
  int? pageSize;
  int? count;
  int? total;
  List<T>? items;
  int? countOfPage;
  Paging({this.pageIndex, this.pageSize, this.count, this.items,this.total,this.countOfPage});

  Paging.fromJson(Map<String, dynamic> json, Function fromJsonModel) {
    pageIndex = json['pageIndex'];
    pageSize = json['pageSize'];
    count = json['count'] ?? 0;
    total = json['total'];
    countOfPage = json['countOfPage'];
    if (json['items'] != null) {
      items = <T>[];
      json['items'].forEach((v) {
        items!.add(fromJsonModel(v));
      });
    }
  }

  bool isEnded() {
      return (pageIndex! + 1) * pageSize! >= total!;
  }
}
