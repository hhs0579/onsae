Report? report;

class Report {
  String reportKey;
  String reportReason;
  int reportType;

  Report(
      {required this.reportKey,
      required this.reportReason,
      required this.reportType});

  Report.fromJson(Map<String, dynamic> json)
      : reportKey = json["reportKey"],
        reportReason = json["reportReason"],
        reportType = json["reportType"];

  Map<String, dynamic> toJson() => {
        'reportKey': reportKey,
        'reportReason': reportReason,
        'reportType': reportType
      };
}
