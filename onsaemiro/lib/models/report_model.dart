Report? report;

class Report {
  String reportKey;
  String postkey;
  String reportReason;
  int reportType;

  Report(
      {required this.reportKey,
      required this.postkey,
      required this.reportReason,
      required this.reportType});

  Report.fromJson(Map<String, dynamic> json)
      : reportKey = json["reportKey"],
        postkey = json["postkey"],
        reportReason = json["reportReason"],
        reportType = json["reportType"];

  Map<String, dynamic> toJson() => {
        'postkey': postkey,
        'reportKey': reportKey,
        'reportReason': reportReason,
        'reportType': reportType
      };
}
