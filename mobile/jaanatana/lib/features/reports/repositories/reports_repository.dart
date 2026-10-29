import 'package:jaanatana/features/reports/data/models/financial_report_model.dart';

abstract class ReportsRepository {
  Future<FinancialReportModel> getReport({String period = 'month'});
  Future<String> exportReportCsv({String period = 'month'});
  Future<List<int>> downloadReportPdf({String period = 'month'});
}
