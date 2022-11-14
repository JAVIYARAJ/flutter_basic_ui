class User{
  final String name;
  final String email;
  final String password;

  User({
    required this.name,
    required this.email,
    required this.password});

  Map<String,dynamic> toJson()=>{
    "name":name,
    "email":email,
    "password":password
  };

  static User fromJson(Map<String,dynamic> json)=>
      User(
          name: json["name"],
          email: json["email"],
          password: json["password"]);

}

class VideoModel{
  final String title;
  final String time;
  final String videoUrl;

  VideoModel({required this.title,required this.time,required this.videoUrl});


  static VideoModel fromJson(Map<String,dynamic> json)=>
      VideoModel(title: json["title"], time: json["time"], videoUrl: json["videoUrl"]);

}