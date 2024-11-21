import 'dart:async';

import 'package:bases2/features/auth/data/datasources/local/local_auth.dart';
import 'package:bases2/features/auth/data/datasources/remote/auth_api.dart';
import 'package:bases2/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:bases2/features/auth/domain/repositories/auth_repository.dart';
import 'package:bases2/features/referrals/data/datasource/remote/referral_api.dart';
import 'package:bases2/features/referrals/data/repository_impl/referral_impl.dart';
import 'package:bases2/features/referrals/domain/entities/referral.dart';
import 'package:bases2/features/referrals/domain/repositories/referrals_repository.dart';
import 'package:get/get.dart';

class ReferralsViewmodel extends GetxController {
  @override
  void onInit() async {
    await getReferrals();
    super.onInit();
  }

  final ReferralsRepository _referralsRepository =
      ReferralRepositoryImpl(referralApi: ReferralApi());
  final AuthRepository _authRepository =
      AuthRepositoryImpl(authApi: AuthApi(), localAuth: LocalAuth());

  final RxList<Referral> referrals = <Referral>[].obs;

  Future<void> getReferrals() async {
    final user = await _authRepository.getUserData();

    final result = await _referralsRepository.getReferrals(userId: user!.id);
    result.fold((left) => Get.snackbar('errro', left.toString()),
        (right) => referrals.addAll(right));
  }

  ////
  ////
  static ReferralsViewmodel get findOrInitial {
    try {
      return Get.find<ReferralsViewmodel>();
    } catch (e) {
      return Get.put(ReferralsViewmodel());
    }
  }
}
