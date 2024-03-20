import 'package:raven_frontend/components/onboardingInfo.dart';

class OnboardingData{
  List<OnboardingInfo> items = [
    OnboardingInfo(
        title: "Safety at your fingertips",
        description: "Introducing RAVEN , your complete home safety solution.", 
        image: "raven_frontend/images/onboarding/OB1.png"),

    OnboardingInfo(
        title: "Smart Security with Real-Time Analysis",
        description: "Real-time alerts on suspicious activity. Take control, instantly.", 
        image: "raven_frontend/images/onboarding/OB2.gif"),

    OnboardingInfo(
        title: "Integrated Emergency Response for Faster Help",
        description: "In critical situations, get immediate assistance from the closest Police, Hospital, and Ambulance with a tap.", 
        image: "raven_frontend/images/onboarding/OB1.png"),
  ];
}