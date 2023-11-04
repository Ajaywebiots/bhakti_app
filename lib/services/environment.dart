
String apiUrl ="https://api.sadhanasheet.com/v1";
Map<String, String>?  headersToken(token) => {'Accept': 'application/json', 'Content-Type': 'application/json',"Authorization" :"Bearer $token"};

Map<String, String>? get  headers => {'Accept': 'application/json', 'Content-Type': 'application/json'};