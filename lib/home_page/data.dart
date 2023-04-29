import 'package:flutterapp/models/user_model.dart';

class Data {
  static final List<UserPostModel> postList = [
    UserPostModel(
        name: "Bill Gates",
        profileUrl: "assets/profile1.png",
        headline: "Co-chair, Bill & Melinda Gates Foundation",
        tags:
            "#positivity #motivation #learning #progress #development #networking #business #jobhunters #jobseekers #connections #networking #linkedin #nevergiveup #staypositive #staystrong #positiveattitude",
        description:
            "I recently had a chance to check out some of the latest devices and experiences in augmented reality. It was a lot of fun to see how far the hardware has come.I recently had a chance to check out some of the latest devices and experiences in augmented reality. It was a lot of fun to see how far the hardware has come.",
        isVideoPost: false,
        comments: "358",
        video: "",
        isOnline: false,
        image: "assets/post1.jpg",
        likes: "19174"),
    UserPostModel(
        name: "Marko Latvakoski",
        profileUrl: "assets/profile2.jpg",
        headline: "Missionary at Kingdom of God",
        tags: "#Global University",
        description:
            "I am not ashamed to say I Love Lord Jesus Christ My Saviour and God.",
        isVideoPost: false,
        comments: "1k",
        video: "",
        isOnline: true,
        image: "assets/post2.jpg",
        likes: "20k"),
    UserPostModel(
        name: "Netflix",
        profileUrl: "assets/profile3.jpg",
        headline: "Watch TV Shows Online, Watch Movies Online",
        tags: "#datascience #machinelearning #programming #python #joke",
        description:
            "Netflix is a streaming service that offers a wide variety of award-winning TV shows, movies, anime, documentaries :)",
        isVideoPost: false,
        comments: "100",
        video: "",
        isOnline: true,
        image: "assets/post3.jpg",
        likes: "230"),
    UserPostModel(
        name: "Maria Malik",
        profileUrl: "assets/profile4.jpg",
        headline:
            "I help corporate introverts overcome their fear of Public Speaking in 6 weeks | Give presentations that make your team listen | Excel at Impromptu Speaking | Corporate Speaking Coach 🎤 | Masterclass ⬇️ speakatwork.comI help corporate introverts overcome their fear of Public Speaking in 6 weeks | Give presentations that make your team listen | Excel at Impromptu Speaking | Corporate Speaking Coach 🎤 | Masterclass ⬇️ speakatwork.com",
        tags:
            "#freedom #possibilities #beauty #personaldevelopment #personalgrowth",
        description:
            "I paid \$100 for this photo on top of the Burj Khalifa.What a waste of money Many people won\’t understand why",
        isVideoPost: false,
        comments: "500",
        video: "",
        isOnline: false,
        image: "assets/post4.jpg",
        likes: "10k"),
  ];
  static final userProfile = UserModel(
      headline: "Software Engineer",
      profileUrl: "assets/profile.jpg",
      name: "Ben Sap",
      connections: "9,837",
      viewProfile: "900");
}
