abstract class DataProvider {
  Future<dynamic> createData(dynamic newData) async {}
  Future<dynamic> readData(dynamic criteria) async {}
  Future<dynamic> updateData(dynamic newData) async {}
  Future<dynamic> deleteData(dynamic dataId) async {}
}