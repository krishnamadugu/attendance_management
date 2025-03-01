part of 'attendance_bloc.dart';

enum AttendanceStatus { initial, loading, success, failure }

extension AttendanceStatusX on AttendanceStatus {
  bool get isInitial => this == AttendanceStatus.initial;
  bool get isLoading => this == AttendanceStatus.loading;
  bool get isSuccess => this == AttendanceStatus.success;
  bool get isError => this == AttendanceStatus.failure;
}

class AttendanceState extends Equatable {
  const AttendanceState({
    this.status = AttendanceStatus.initial,
    List<AttendeeModel>? attendanceDataList,
  }) : attendanceDataList = attendanceDataList ?? const [];

  final List<AttendeeModel> attendanceDataList;
  final AttendanceStatus status;

  @override
  List<Object?> get props => [status, attendanceDataList];

  AttendanceState copyWith({
    final List<AttendeeModel>? attendanceDataList,
    AttendanceStatus? status,
  }) {
    return AttendanceState(
      attendanceDataList: attendanceDataList ?? this.attendanceDataList,
      status: status ?? this.status,
    );
  }
}
