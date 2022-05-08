import 'package:graphql/client.dart';

class GraphQLHelper implements IGraphQLHelper {
  final durationTimeOut = Duration(seconds: 15);
  GraphQLClient getGraphQLClient({String? token}) {
    final Link _link = HttpLink(
      'https://beta.pokeapi.co/graphql/v1beta',
      defaultHeaders: token != null
          ? {}
          : {'content-type': 'application/json', 'accept': '*/*'},
    );

    return GraphQLClient(link: _link, cache: GraphQLCache());
  }

  Future<QueryResult> mutation(
      {required String data,
      String? token,
      Map<String, dynamic>? variables}) async {
    final GraphQLClient _client = getGraphQLClient(
      token: token,
    );

    final MutationOptions options =
        MutationOptions(document: gql(data), variables: variables ?? {});
    try {
      final QueryResult result = await _client
          .mutate(
            options,
          )
          .timeout(
            durationTimeOut,
            onTimeout: () async => _timeoutAPI(),
          );
      if (result.exception == null || result.exception!.linkException == null)
        return result;

      if (!result.exception!.linkException!.originalException
          .toString()
          .contains("SocketException: Failed host lookup")) return result;

      return _timeoutAPI();
    } catch (e) {
      return _timeoutAPI();
    }
  }

  Future<QueryResult> query({
    required String data,
    String? token,
    Map<String, dynamic> variables = const {},
  }) async {
    final GraphQLClient _client = getGraphQLClient(
      token: token,
    );

    final QueryOptions options = QueryOptions(
        document: gql(data),
        variables: variables,
        cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
        fetchPolicy: FetchPolicy.networkOnly,
        errorPolicy: ErrorPolicy.none);
    try {
      final QueryResult result = await _client
          .query(
            options,
          )
          .timeout(
            durationTimeOut,
            onTimeout: () async => _timeoutAPI(),
          );

      if (result.exception == null || result.exception!.linkException == null)
        return result;

      if (!result.exception!.linkException!.originalException
          .toString()
          .contains("SocketException: Failed host lookup"))
        return _timeoutAPI();

      return result;
    } catch (e) {
      return _timeoutAPI();
    }
  }

  QueryResult _timeoutAPI() => QueryResult(
        source: QueryResultSource.network,
        exception: OperationException(
          graphqlErrors: [GraphQLError(message: "timeout")],
        ),
        options: QueryOptions(document: gql(""), variables: {}),
      );
}

abstract class IGraphQLHelper {
  Future<QueryResult> query({required String data, String? token});

  Future<QueryResult> mutation({required String data, String? token});
}
