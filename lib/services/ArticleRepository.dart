import 'package:aghaz/model/article.dart';
import 'package:aghaz/services/api.dart';

class ArticleRepository {
  Api _api;

  Future addArticle(Article data) async {
    var result = await _api.addDocument(data.toJson());
    return;
  }

  Future removeArticle(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future<Article> getArticleById(String id) async {
    var doc = await _api.getDocumentById(id);
    return Article.fromMap(doc.data, doc.documentID);
  }
}
