import 'package:jaanatana/features/transactions/data/datasources/transactions_remote_datasource.dart';
import 'package:jaanatana/features/transactions/data/models/transaction_model.dart';
import 'package:jaanatana/features/transactions/repositories/transactions_repository.dart';

class TransactionsRepositoryImpl implements TransactionsRepository {
  final TransactionsRemoteDataSource remoteDataSource;

  TransactionsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<TransactionModel>> getTransactions({String? type, String? category}) {
    return remoteDataSource.getTransactions(type: type, category: category);
  }

  @override
  Future<TransactionModel?> createTransaction(Map<String, dynamic> data) {
    return remoteDataSource.createTransaction(data);
  }

  @override
  Future<TransactionModel?> updateTransaction(String id, Map<String, dynamic> data) {
    return remoteDataSource.updateTransaction(id, data);
  }

  @override
  Future<bool> deleteTransaction(String id) {
    return remoteDataSource.deleteTransaction(id);
  }
}

