import 'package:bases2/core/api/endpoints.dart';
import 'package:bases2/core/either/either.dart';
import 'package:bases2/features/referrals/domain/entities/referral.dart';
import 'package:dio/dio.dart';

class ReferralApi {
  final dio = Dio();
  Future<Either<Exception, List<Referral>>> getReferral(
      String referralId) async {
    try {
      final response = await dio.get(
        '${Endpoints.getAffiliates}/$referralId',
      );
      if (response.statusCode == 200) {
        List<Referral> referrals = [];
        for (var item in response.data['network']) {
          referrals.add(Referral.fromJson(item));
        }
        return Right(referrals);
      } else {
        return Left(Exception('Failed to load referrals'));
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
