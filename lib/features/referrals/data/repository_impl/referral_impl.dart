import 'package:bases2/core/either/either.dart';
import 'package:bases2/features/referrals/data/datasource/remote/referral_api.dart';
import 'package:bases2/features/referrals/domain/entities/referral.dart';
import 'package:bases2/features/referrals/domain/repositories/referrals_repository.dart';

class ReferralRepositoryImpl implements ReferralsRepository {
  ReferralRepositoryImpl({required this.referralApi});

  final ReferralApi referralApi;
  @override
  Future<Either<Exception, List<Referral>>> getReferrals(
      {required String userId}) async {
    return await referralApi.getReferral(userId);
  }
}
