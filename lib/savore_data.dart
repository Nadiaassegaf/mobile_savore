class MenuItem {
  final String id;
  final String name;
  final String category;
  final int price;
  final String description;
  final String imageUrl;

  MenuItem({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.imageUrl,
  });
}

class TeamMember {
  final String name;
  final String npm;
  final String role;

  TeamMember({
    required this.name,
    required this.npm,
    required this.role,
  });
}

final List<MenuItem> sampleMenus = [
  MenuItem(
    id: 'w1',
    name: 'Truffle Steak',
    category: 'Western',
    price: 250000,
    description: 'Daging sapi tenderloin panggang dengan saus truffle hitam khas Savore.',
    imageUrl: 'https://images.unsplash.com/photo-1600891964092-4316c288032e?w=600',
  ),
  MenuItem(
    id: 'w2',
    name: 'Creamy Spaghetti',
    category: 'Western',
    price: 180000,
    description: 'Pasta spaghetti al dente dengan saus krim keju parmesan dan jamur truffle.',
    imageUrl: 'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=600',
  ),
  MenuItem(
    id: 'w3',
    name: 'Royal Wagyu Burger',
    category: 'Western',
    price: 165000,
    description: 'Roti brioche lembut dengan patty wagyu premium, keju cheddar, dan saus spesial.',
    imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=600',
  ),
  MenuItem(
    id: 'w4',
    name: 'Quattro Formaggi Pizza',
    category: 'Western',
    price: 195000,
    description: 'Pizza tipis renyah khas Italia dengan perpaduan 4 jenis keju premium.',
    imageUrl: 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=600',
  ),
  MenuItem(
    id: 'j1',
    name: 'Dragon Salmon Sushi',
    category: 'Japanese',
    price: 145000,
    description: 'Sushi roll isi tempura udang dengan topping salmon segar panggang.',
    imageUrl: 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=600',
  ),
  MenuItem(
    id: 'j2',
    name: 'Signature Wagyu Ramen',
    category: 'Japanese',
    price: 135000,
    description: 'Mie ramen kenyal dalam kuah kaldu gurih kaya rasa dengan irisan daging wagyu.',
    imageUrl: 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=600',
  ),
  MenuItem(
    id: 'r1',
    name: 'Beef Teriyaki Ricebowl',
    category: 'Ricebowl',
    price: 95000,
    description: 'Nasi hangat pulen dengan irisan daging sapi saus teriyaki dan wijen.',
    imageUrl: 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=600',
  ),
  MenuItem(
    id: 'd1',
    name: 'Gold Chocolate Lava',
    category: 'Dessert',
    price: 85000,
    description: 'Kue cokelat hangat meleleh di dalam dengan taburan emas dan es krim vanila.',
    imageUrl: 'https://images.unsplash.com/photo-1624353365286-3f8d62daad51?w=600',
  ),
  MenuItem(
    id: 'dr1',
    name: 'Velvet Berry Mocktail',
    category: 'Drinks',
    price: 65000,
    description: 'Minuman segar campuran buah beri ungu, bunga telang, dan soda dingin.',
    imageUrl: 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=600',
  ),
];

final List<TeamMember> teamMembers = [
  TeamMember(name: 'Amanda Keysa', npm: '5520124003', role: 'UI/UX & Frontend Developer'),
  TeamMember(name: 'Syarifah Hadia', npm: '5520124030', role: 'Frontend & State Management'),
  TeamMember(name: 'M. Lintang', npm: '5520124015', role: 'Asset & Menu Data Designer'),
  TeamMember(name: 'Tolut', npm: '5520124031', role: 'Quality Assurance & Documentation'),
];