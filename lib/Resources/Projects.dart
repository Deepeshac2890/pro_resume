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
      techStack: ['Flutter', 'Firebase']),
  Project(
      name: 'Absolute Fitness App',
      image: Assets.absoluteFitness,
      description:
          'An App which is being developed for Absolute Fitness Gym Pune in which the user can join virtual scheduled classes. It allows the admin to enroll a new members to gym and schedule classes.',
      link: 'https://github.com/Deepeshac2890/abs_fitness',
      isCompleted: true,
      techStack: ['Flutter', 'Firebase']),
  Project(
      name: 'Smart Sanitization Project',
      image: Assets.sanitizationProject,
      description:
          'Developed Toilet finder and feedback application as an input for the inference engine along with sensor data and containerized the inference engine and deployed it on Raspberry-Pi chip.',
      link: 'N.A',
      isCompleted: true,
      techStack: ['Python', 'Docker', 'Native Android']),
];
