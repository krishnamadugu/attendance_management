import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/common_models/sheet_attendee_model.dart';
import '../../data/attendance_repo_provider.dart';

part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final AttendanceRepoProvider repoProvider;

  /// method calling based on events
  AttendanceBloc({
    required this.repoProvider,
  }) : super(AttendanceState()) {
    on<FetchAttendanceByDateEvent>(fetchDataByDate);
    on<UpdateCheckInOutValEvent>(updateCheckInOutValue);
  }

  void fetchDataByDate(
      AttendanceEvent event, Emitter<AttendanceState> emit) async {
    /// emitting loading state
    emit(state.copyWith(
      status: AttendanceStatus.loading,
    ));
    try {
      final attendeeStatusList = await repoProvider.fetchAllAttendeeInfo();

      /// emitting success state
      emit(state.copyWith(
        status: AttendanceStatus.success,
        attendanceDataList: attendeeStatusList,
      ));
    } catch (error, stacktrace) {
      debugPrint(stacktrace.toString());

      /// emitting error state
      emit(state.copyWith(
        status: AttendanceStatus.failure,
      ));
    }
  }

  void updateCheckInOutValue(
      UpdateCheckInOutValEvent event, Emitter<AttendanceState> emit) async {
    /// emitting loading state
    emit(state.copyWith(
      status: AttendanceStatus.loading,
    ));
    try {
      final attendeeStatusList = await repoProvider.onCheckInCheckOutUpdate(
          rowId: event.rowId, colKey: event.colKey, value: event.value);

      /// emitting success state
      emit(state.copyWith(
        status: AttendanceStatus.success,
        attendanceDataList: attendeeStatusList,
      ));
    } catch (error, stacktrace) {
      debugPrint(stacktrace.toString());

      /// emitting error state
      emit(state.copyWith(
        status: AttendanceStatus.failure,
      ));
    }
  }
}
