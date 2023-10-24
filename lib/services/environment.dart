
String apiUrl ="https://fixit.webiots.co.in/api";
Map<String, String>?  headersToken(token) => {'Accept': 'application/json', 'Content-Type': 'application/json',"Authorization" :"Bearer $token"};

Map<String, String>? get  headers => {'Accept': 'application/json', 'Content-Type': 'application/json'};