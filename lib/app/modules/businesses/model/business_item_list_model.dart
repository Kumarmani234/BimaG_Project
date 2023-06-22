class BusinessListItemModel{
  String name, rating, totalRating, address, timing, phone, latitude, longitude, logo;

  BusinessListItemModel({
    required this.name,   
    required this.rating,   
    required this.totalRating,   
    required this.address,   
    required this.timing,   
    required this.phone,   
    required this.latitude,
    required this.longitude,
    required this.logo
  });

}

List<BusinessListItemModel> businessList = [
  BusinessListItemModel(name: 'Raj Girish Hospital', rating: '4.4', totalRating: '105', address: 'Gandhi Path, Vaishali Nagar, C1/27-29, ...', timing: 'Open 24 hours', phone: '9898989988', latitude: '35.567', longitude: '128.765', logo: 'https://picsum.photos/200/300'),
  BusinessListItemModel(name: 'Raj Girish Hospital', rating: '4.4', totalRating: '105', address: 'Gandhi Path, Vaishali Nagar, C1/27-29, ...', timing: 'Open 24 hours', phone: '9898989988', latitude: '35.567', longitude: '128.765', logo: 'https://picsum.photos/200/300'),
  BusinessListItemModel(name: 'Raj Girish Hospital', rating: '4.4', totalRating: '105', address: 'Gandhi Path, Vaishali Nagar, C1/27-29, ...', timing: 'Open 24 hours', phone: '9898989988', latitude: '35.567', longitude: '128.765', logo: 'https://picsum.photos/200/300')
];