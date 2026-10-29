import 'package:jaanatana/core/constants/api_endpoints.dart';
import 'package:jaanatana/core/network/api_client.dart';
import 'package:jaanatana/features/cash_flow/data/models/cash_flow_model.dart';

class CashFlowRemoteDataSource {
  final ApiClient apiClient;

  CashFlowRemoteDataSource(this.apiClient);

  Future<CashFlowModel> getCashFlow({int days = 30}) async {
    final res = await apiClient.dio.get(
      ApiEndpoints.financialCashFlow,
      queryParameters: {'days': days},
    );

    return CashFlowModel.fromJson(res.data as Map<String, dynamic>);
  }
}
