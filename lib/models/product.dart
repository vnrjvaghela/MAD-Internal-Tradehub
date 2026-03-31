class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final double rating;
  final int reviewsCount;
  final String sellerId;
  final String sellerName;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.reviewsCount,
    required this.sellerId,
    required this.sellerName,
  });
}

final List<Product> dummyProducts = [
  Product(
    id: '1',
    title: 'Vintage Royal Enfield Bullet',
    description: 'A classic Royal Enfield Bullet in pristine condition. Regularly serviced and well-maintained. Perfect for enthusiasts.',
    price: 150000,
    imageUrl: 'https://images.unsplash.com/photo-1558981806-ec527fa84c39?auto=format&fit=crop&q=80&w=800',
    rating: 4.8,
    reviewsCount: 12,
    sellerId: 's1',
    sellerName: 'Ravi Kumar',
  ),
  Product(
    id: '2',
    title: 'Handcrafted Wooden Almirah',
    description: 'Beautiful traditional Indian style wooden almirah with intricate carvings. Solid teak wood.',
    price: 15000,
    imageUrl: 'https://images.unsplash.com/photo-1595428774223-ef52624120d2?auto=format&fit=crop&q=80&w=800',
    rating: 4.5,
    reviewsCount: 8,
    sellerId: 's2',
    sellerName: 'Anita Sharma',
  ),
  Product(
    id: '3',
    title: 'MacBook Air M1',
    description: 'Barely used MacBook Air M1, 8GB RAM, 256GB SSD. Battery health 98%. Comes with original bill and box.',
    price: 55000,
    imageUrl: 'https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?auto=format&fit=crop&q=80&w=800',
    rating: 4.9,
    reviewsCount: 24,
    sellerId: 's3',
    sellerName: 'Vikram Singh',
  ),
  Product(
    id: '4',
    title: 'Sony Alpha a7III Camera',
    description: 'Professional mirrorless camera with 28-70mm lens. Great condition, used mainly for indoor videography.',
    price: 110000,
    imageUrl: 'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?auto=format&fit=crop&q=80&w=800',
    rating: 4.7,
    reviewsCount: 15,
    sellerId: 's4',
    sellerName: 'Priya Patel',
  ),
];
