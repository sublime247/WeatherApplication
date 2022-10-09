class Weather{
  final String? city;
  final String? country;
  final String?description;
  final String? temperature;
  final String? humidity;
  final String? windSpeed;
  final String? windDirection;
  final String? pressure;
  final String? icon;

  Weather({
    this.city,
    this.country,
    this.description,
    this.temperature,
    this.humidity,
    this.windSpeed,
    this.windDirection,
    this.pressure,
    this.icon
  });

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      city: json['name'],
      country: json['sys']['country'],
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'].toString(),
      humidity: json['main']['humidity'].toString(),
      windSpeed: json['wind']['speed'].toString(),
      windDirection: json['wind']['deg'].toString(),
      pressure: json['main']['pressure'].toString(),
      icon: json['weather'][0]['icon']
    );
  }
}