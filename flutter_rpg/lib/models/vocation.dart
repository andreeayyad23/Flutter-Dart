// vocation.dart
enum VocationType {
  raider,
  junkie,
  ninja,
  wizard,
}

class Vocation {
  const Vocation({
    required this.name,
    required this.imageAsset,
    required this.description,
    required this.specialAbility,
    required this.weapon,
  });

  final String name;
  final String imageAsset;
  final String description;
  final String specialAbility;
  final String weapon;

  // Add a title getter if needed
  String get title => name;

  static const Map<VocationType, Vocation> vocations = {
    VocationType.raider: Vocation(
      name: 'Terminal Raider',
      description: 'Adept in terminal commands to trigger traps.',
      weapon: 'Terminal',
      specialAbility: 'Shellshock',
      imageAsset: 'terminal_raider.jpg',
    ),
    VocationType.junkie: Vocation(
      name: 'Code Junkie',
      description: 'Uses code to inflict enemy defenses.',
      weapon: 'React 99',
      specialAbility: 'Higher Order Overdrive',
      imageAsset: 'code_junkie.jpg',
    ),
    VocationType.ninja: Vocation(
      name: 'UX Ninja',
      description: 'Uses quick & stealthy visual attacks.',
      weapon: 'Infused Stylus',
      specialAbility: 'Triple Swipe',
      imageAsset: 'ux_ninja.jpg',
    ),
    VocationType.wizard: Vocation(
      name: 'Algo Wizard',
      description: 'Carries a staff to unleash algorithmic magic.',
      weapon: 'Crystal Staff',
      specialAbility: 'Algorithmic Daze',
      imageAsset: 'algo_wizard.jpg',
    ),
  };
}