// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_report.remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CalendarItemRemoteModel _$CalendarItemRemoteModelFromJson(
  Map<String, dynamic> json,
) => _CalendarItemRemoteModel(
  etag: json['etag'] as String?,
  status: (json['status'] as num?)?.toInt(),
  data: json['data'] as List<dynamic>,
);

Map<String, dynamic> _$CalendarItemRemoteModelToJson(
  _CalendarItemRemoteModel instance,
) => <String, dynamic>{
  'etag': instance.etag,
  'status': instance.status,
  'data': instance.data,
};

_CalendarReportEmbeddedRemoteModel _$CalendarReportEmbeddedRemoteModelFromJson(
  Map<String, dynamic> json,
) => _CalendarReportEmbeddedRemoteModel(
  items:
      (json['dav:item'] as List<dynamic>?)
          ?.map(
            (e) => CalendarItemRemoteModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <CalendarItemRemoteModel>[],
  syncToken: json['sync-token'] as String?,
);

Map<String, dynamic> _$CalendarReportEmbeddedRemoteModelToJson(
  _CalendarReportEmbeddedRemoteModel instance,
) => <String, dynamic>{
  'dav:item': instance.items,
  'sync-token': instance.syncToken,
};

_CalendarReportRemoteModel _$CalendarReportRemoteModelFromJson(
  Map<String, dynamic> json,
) => _CalendarReportRemoteModel(
  embedded: CalendarReportEmbeddedRemoteModel.fromJson(
    json['_embedded'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$CalendarReportRemoteModelToJson(
  _CalendarReportRemoteModel instance,
) => <String, dynamic>{'_embedded': instance.embedded};
