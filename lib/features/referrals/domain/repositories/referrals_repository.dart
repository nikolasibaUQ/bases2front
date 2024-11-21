import 'package:bases2/core/either/either.dart';
import 'package:bases2/features/referrals/domain/entities/referral.dart';

abstract class ReferralsRepository {
  Future<Either<Exception, List<Referral>>> getReferrals(
      {required String userId});
}
