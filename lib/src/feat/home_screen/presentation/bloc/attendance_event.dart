part of 'attendance_bloc.dart';

sealed class AttendanceEvent extends Equatable {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class FetchAttendanceByDateEvent extends AttendanceEvent {
  final String date;
  FetchAttendanceByDateEvent({
    required this.date,
  });
}

class UpdateCheckInOutValEvent extends AttendanceEvent {
  final int rowId;
  final String colKey;
  final String value;
  UpdateCheckInOutValEvent({
    required this.rowId,
    required this.colKey,
    required this.value,
  });
}
