import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/auth/data/sources/auth_local_source.dart';
import 'package:health_mate/src/service_options/domain/entities/service_entity.dart';
import 'package:health_mate/src/service_options/domain/usecase/get_services.dart';
import 'package:health_mate/src/service_options/domain/usecase/update_service.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class ServiceNotifier extends StateNotifier<List<ServiceEntity>> {
  final GetServiceUseCase _getServiceUseCase;
  final UpdateServiceUseCase _updateServiceUseCase;

  ServiceNotifier(
    this._getServiceUseCase,
    this._updateServiceUseCase,
  ) : super([]) {
    _init();
  }

  Future<void> _init() async {
    try {
      final consultantId = await AuthLocalSource().getConsultantId();
      if (consultantId != null) {
        await fetchServiceList(consultantId);
      }
    } catch (e) {
      logger.e("Lỗi khi khởi tạo danh sách dịch vụ", error: e);
    }
  }

  Future<void> fetchServiceList(int consultantId) async {
    try {
      final services = await _getServiceUseCase(consultantId);
      state = services;
    } catch (e) {
      logger.e("Lỗi khi lấy danh sách dịch vụ", error: e);
    }
  }

  Future<void> updatePrice(String key, double newPrice) async {
    try {
      final consultantId = await AuthLocalSource().getConsultantId();
      if (consultantId == null) return;

      final serviceIndex = state.indexWhere((service) => service.key == key);
      if (serviceIndex == -1) return;

      final updatedService = state[serviceIndex].copyWith(price: newPrice);

      await _updateServiceUseCase(consultantId, updatedService);

      state = [...state]..[serviceIndex] = updatedService;
    } catch (e) {
      logger.e("Lỗi khi cập nhật giá", error: e);
    }
  }

  Future<void> updateMultiplePrices(Map<String, double> prices) async {
    try {
      final consultantId = await AuthLocalSource().getConsultantId();
      if (consultantId == null) return;

      List<ServiceEntity> updatedServices = [];

      // Cập nhật danh sách dịch vụ trước
      for (var entry in prices.entries) {
        final serviceIndex =
            state.indexWhere((service) => service.key == entry.key);
        if (serviceIndex == -1) continue;

        final updatedService = state[serviceIndex].copyWith(price: entry.value);
        updatedServices.add(updatedService);
      }

      // Chạy các cập nhật song song
      await Future.wait(updatedServices.map(
        (service) => _updateServiceUseCase(consultantId, service),
      ));

      // Cập nhật state với dữ liệu mới
      state = [
        for (var service in state)
          updatedServices.firstWhere(
            (updated) => updated.key == service.key,
            orElse: () => service,
          )
      ];
    } catch (e) {
      logger.e("Lỗi khi cập nhật nhiều giá", error: e);
    }
  }
}
