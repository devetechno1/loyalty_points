import 'package:loyalty_points/features/auth/data/models/address_model.dart';
import 'package:loyalty_points/features/auth/domain/entity/sign_up_body_data.dart';

import '../../../../core/status/status.dart';
import '../../../../core/utils/functions/execute_and_handle_remote_errors.dart';
import '../../domain/entity/login_request_data.dart';
import '../../domain/repositories/auth_repositories.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoriesImp extends AuthRepositories {
  const AuthRepositoriesImp({
    required this.localDataSource,
    required this.remoteDataSource,
  });
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<Status<UserModel>> login(LoginRequestData data) {
    return executeAndHandleErrors<UserModel>(
      () async {
        final ({UserModel user, String token}) res =
            await remoteDataSource.login(data);
        if (res.user.isVerified) {
          await Future.wait(
            [
              localDataSource.saveUser(res.user),
              localDataSource.saveToken(res.token),
            ],
          );
        }

        return res.user;
      },
    );
  }

  @override
  Future<Status<void>> signUp(SignUpBodyData body) {
    return executeAndHandleErrors<void>(
      () => remoteDataSource.signUp(body),
    );
  }

  @override
  Future<Status<List<AddressModel>>> getCountries() {
    return executeAndHandleErrors<List<AddressModel>>(
      () => remoteDataSource.getCountries(),
    );
  }

  @override
  Future<Status<List<AddressModel>>> getGovernorates(int countryId) {
    return executeAndHandleErrors<List<AddressModel>>(
      () => remoteDataSource.getGovernorates(countryId),
    );
  }

  @override
  Future<Status<List<AddressModel>>> getCities(int governorateId) {
    return executeAndHandleErrors<List<AddressModel>>(
      () => remoteDataSource.getCities(governorateId),
    );
  }
}
