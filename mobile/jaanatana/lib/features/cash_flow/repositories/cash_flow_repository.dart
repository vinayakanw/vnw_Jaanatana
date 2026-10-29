import 'package:jaanatana/features/cash_flow/data/models/cash_flow_model.dart';

abstract class CashFlowRepository {
  Future<CashFlowModel> getCashFlow({int days = 30});
}
