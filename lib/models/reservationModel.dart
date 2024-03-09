class TicketModel{
String? status;
String? message;

TicketDataModel? data;

 TicketModel.fromjason(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? TicketDataModel.fromjason(json['data']) : null;
  }
}

class TicketDataModel{
String? UsreID;
String? UsreName;
String? price;
String? date;
String? Nom_watingList;

 TicketDataModel.fromjason(Map<String, dynamic> json) {
    UsreName = json['UsreName'];
    price = json['UsreID'];
    date = json['UsreID'];
    Nom_watingList = json['UsreID'];

  }

}