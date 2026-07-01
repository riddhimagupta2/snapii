class TriggerTypeModel {
  final String id;
  final String icon;
  final String title;
  final String subtitle;
  final bool isPopular;

  const TriggerTypeModel({
    required this.id,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isPopular = false,
  });
}