import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:grpc/grpc.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

const _tokenExpirationThreshold = Duration(seconds: 30);

class CustomJwtAuthenticator extends BaseAuthenticator {
  CustomJwtAuthenticator() : super();
  AccessToken? _accessToken;

  @override
  Future<void> obtainAccessCredentials(String uri) async {
    final key = 's3cr3t';
    final claimSet = JwtClaim(
      subject: '1',
      issuer: 'grpc_client_cli',
      payload: <String, dynamic>{
        'first_name': 'John',
        'last_name': 'Doe',
        'username': 'jdoe',
      },
      maxAge: const Duration(minutes: 5),
    );

    String token = issueJwtHS256(claimSet, key);
    _accessToken = AccessToken('Bearer', token, claimSet.expiry!);
  }

  @override
  Future<void> authenticate(Map<String, String> metadata, String uri) async {
    if (_accessToken == null || _accessToken!.hasExpired) {
      await obtainAccessCredentials(uri);
    }

    final auth = '${_accessToken!.type} ${_accessToken!.data}';
    metadata['authorization'] = auth;

    if (_tokenExpiresSoon) {
      // Token is about to expire. Extend it prematurely.
      obtainAccessCredentials('').catchError((_) {});
    }
  }

  bool get _tokenExpiresSoon => _accessToken!.expiry
      .subtract(_tokenExpirationThreshold)
      .isBefore(DateTime.now().toUtc());
}
