// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:timezone/timezone.dart' as tz;
import 'package:intl/intl.dart';

class ClockHistoryResponse {
  final List<ClockHistory>? clocks;
  final Pagination? pagination;

  ClockHistoryResponse({
    this.clocks,
    this.pagination,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clocks': clocks?.map((x) => x.toMap()).toList(),
      'pagination': pagination?.toMap(),
    };
  }

  factory ClockHistoryResponse.fromMap(Map<String, dynamic> map) {
    return ClockHistoryResponse(
      clocks: map['clocks'] != null
          ? List<ClockHistory>.from((map['clocks'] as List)
              .map((x) => ClockHistory.fromMap(x as Map<String, dynamic>)))
          : null,
      pagination: map['pagination'] != null
          ? Pagination.fromMap(map['pagination'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClockHistoryResponse.fromJson(String source) =>
      ClockHistoryResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Pagination {
  final int? currentPage;
  final String? nextPageUrl;
  final String? previousPageUrl;
  final int? lastPage;
  final int? total;
  Pagination({
    this.currentPage,
    this.nextPageUrl,
    this.previousPageUrl,
    this.lastPage,
    this.total,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'current_page': currentPage,
      'next_page_url': nextPageUrl,
      'previous_page_url': previousPageUrl,
      'last_page': lastPage,
      'total': total,
    };
  }

  factory Pagination.fromMap(Map<String, dynamic> map) {
    return Pagination(
      currentPage:
          map['current_page'] != null ? map['current_page'] as int : null,
      nextPageUrl:
          map['next_page_url'] != null ? map['next_page_url'] as String : null,
      previousPageUrl: map['previous_page_url'] != null
          ? map['previous_page_url'] as String
          : null,
      lastPage: map['last_page'] != null ? map['last_page'] as int : null,
      total: map['total'] != null ? map['total'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pagination.fromJson(String source) =>
      Pagination.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ClockHistory {
  final int? id;
  final String? day;
  final String? date;
  final String? clockIn;
  final String? clockOut;
  final String? totalHours;
  final int? userId;
  final String? site;
  final String? formattedClockIn;
  final String? formattedClockOut;
  final List<ClockHistory> otherClocks;
  ClockHistory({
    this.id,
    this.day,
    this.date,
    this.clockIn,
    this.clockOut,
    this.totalHours,
    this.userId,
    this.site,
    this.formattedClockIn,
    this.formattedClockOut,
    this.otherClocks = const [],
  });

  String _convertTimeToEgyptLocalTime(String? timeStr) {
    if (timeStr == null) return '-';
    try {
      final DateTime utcDateTime = DateFormat('hh:mma').parseUtc(timeStr);
      tz.TZDateTime egyptDateTime =
          tz.TZDateTime.from(utcDateTime, tz.getLocation('Africa/Cairo'));
      if (egyptDateTime.timeZoneOffset.inHours == 2) {
        egyptDateTime = egyptDateTime.add(const Duration(hours: 1));
      }
      final DateFormat outputFormat = DateFormat('hh:mm a');
      return outputFormat.format(egyptDateTime);
    } catch (e) {
      return 'Invalid Time Format';
    }
  }

  String _convertTimeToUtc(String? timeStr) {
    if (timeStr == null) return '-';
    try {
      final DateTime localTime = DateFormat('hh:mma').parse(timeStr);
      final tz.TZDateTime egyptDateTime =
          tz.TZDateTime.from(localTime, tz.getLocation('Africa/Cairo'));
      final DateTime utcDateTime = egyptDateTime.toUtc();
      final DateFormat outputFormat = DateFormat('hh:mm a');
      return outputFormat.format(utcDateTime);
    } catch (e) {
      return 'Invalid Time Format';
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'Day': day,
      'Date': date,
      'clockIn': clockIn,
      'clockOut': clockOut,
      'totalHours': totalHours,
      'userId': userId,
      'site': site,
      'formattedClockIn': ClockHistory()._convertTimeToUtc(formattedClockIn),
      'formattedClockOut': ClockHistory()._convertTimeToUtc(formattedClockOut),
      'otherClocks': otherClocks.map((x) => x.toMap()).toList(),
    };
  }

  factory ClockHistory.fromMap(Map<String, dynamic> map) {
    return ClockHistory(
        id: map['id'] != null ? map['id'] as int : null,
        day: map['Day'] != null ? map['Day'] as String : null,
        date: map['Date'] != null ? map['Date'] as String : null,
        clockIn: ClockHistory()
            ._convertTimeToEgyptLocalTime(map['clockIn'] as String?),
        clockOut: ClockHistory()
            ._convertTimeToEgyptLocalTime(map['clockOut'] as String?),
        totalHours:
            map['totalHours'] != null ? map['totalHours'] as String : null,
        userId: map['userId'] != null ? map['userId'] as int : null,
        site: map['site'] != null ? map['site'] as String : null,
        formattedClockIn: map['formattedClockIn'] != null
            ? map['formattedClockIn'] as String
            : null,
        formattedClockOut: map['formattedClockOut'] != null
            ? map['formattedClockOut'] as String
            : null,
        otherClocks: map['otherClocks'] != null
            ? List<ClockHistory>.from((map['otherClocks'] as List)
                .map((x) => ClockHistory.fromMap(x as Map<String, dynamic>)))
            : []);
  }

  String toJson() => json.encode(toMap());

  factory ClockHistory.fromJson(String source) =>
      ClockHistory.fromMap(json.decode(source) as Map<String, dynamic>);

  ClockHistory copyWith({
    int? id,
    String? day,
    String? date,
    String? clockIn,
    String? clockOut,
    int? userId,
    String? site,
    String? totalHours,
    String? formattedClockIn,
    String? formattedClockOut,
  }) {
    return ClockHistory(
      id: id ?? this.id,
      day: day ?? this.day,
      date: date ?? this.date,
      clockIn: clockIn ?? this.clockIn,
      clockOut: clockOut ?? this.clockOut,
      userId: userId ?? this.userId,
      site: site ?? this.site,
      totalHours: totalHours ?? this.totalHours,
      formattedClockIn: formattedClockIn ?? this.formattedClockIn,
      formattedClockOut: formattedClockOut ?? this.formattedClockOut,
    );
  }
}
