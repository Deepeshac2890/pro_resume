import '../Model/projectModel.dart';
import 'assetsConstant.dart';

final List<Project> projects = [
  Project(
      name: 'BuyCycle',
      image: Assets.buyCycle,
      description:
          'An app for buyers and sellers with privacy settings and object detection for verification. Encrypted chat option has been added for secure communication between buyer and seller. Translation option is also added to help customers communicate easily.',
      link: 'https://github.com/Deepeshac2890/flutter_buycycle',
      techStack: ['Flutter', 'Firebase', 'Native Android'],
      isCompleted: true),
  Project(
      name: 'Travel Buddy',
      image: Assets.travelBuddy,
      description:
          'An App which gives information about a city including weather and maps. Implemented feature which helps travelers to pack luggage by using QR based Item suggester & packing verifier. It also lets them to add review and save tickets for a trip.',
      link: 'https://github.com/Deepeshac2890/scan_n_select',
      isCompleted: true,
      techStack: ['Flutter', 'Firebase', 'Dart']),
  Project(
      name: 'Absolute Fitness',
      image: Assets.absoluteFitness,
      description:
          'An App which is being developed for Absolute Fitness Gym Pune in which the user can join virtual scheduled classes. It allows the admin to enroll a new members to gym and schedule classes.',
      link: 'https://github.com/Deepeshac2890/abs_fitness',
      isCompleted: true,
      techStack: ['Flutter', 'Firebase', 'Dart']),
  Project(
      name: 'Smart Sanitization',
      image: Assets.sanitizationProject,
      description:
          'Developed Toilet finder and feedback application as an input for the inference engine along with sensor data and containerized the inference engine and deployed it on Raspberry-Pi chip.',
      link: 'N.A',
      isCompleted: true,
      techStack: ['Python', 'Docker', 'Native Android']),
  Project(
      name: 'Portfolio Website',
      image: Assets.resume,
      description:
          'Developed a web application that serves the purpose of online portfolio in which viewers can download the resume specific to role and can view the projects with filters based on skill and status.',
      link: 'https://github.com/Deepeshac2890/pro_resume',
      isCompleted: true,
      techStack: ['Flutter Web', 'Firebase', 'Dart']),
  Project(
      name: 'Grocer Guys',
      image: Assets.grocerGuys,
      description:
          'Worked on the The Grocer Guys application which was an online supermarket shopping app. Worked as a freelance developer for the organization was responsible for api integrations and creation of UI elements using flutter. ',
      link: 'N.A',
      isCompleted: true,
      techStack: ['Flutter', 'Firebase', 'Dart']),
];
