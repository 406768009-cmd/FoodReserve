import '../models/models.dart';

final List<Restaurant> restaurants = [
  Restaurant(
    name: 'ร้านครัวชมพู',
    type: 'อาหารไทย • ซีฟู้ด',
    image:
    'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=900',
    rating: 4.8,
    location: 'หาดใหญ่',
  ),
  Restaurant(
    name: 'Sakura Japanese',
    type: 'อาหารญี่ปุ่น • ซูชิ',
    image:
    'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=900',
    rating: 4.7,
    location: 'หาดใหญ่',
  ),
  Restaurant(
    name: 'Steak House',
    type: 'สเต๊ก • อาหารตะวันตก',
    image:
    'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=900',
    rating: 4.6,
    location: 'สงขลา',
  ),
  Restaurant(
    name: 'Pizza House',
    type: 'พิซซ่า • อิตาเลียน',
    image:
    'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=900',
    rating: 4.5,
    location: 'หาดใหญ่',
  ),
  Restaurant(
    name: 'Seafood Cafe',
    type: 'อาหารทะเล • ซีฟู้ด',
    image:
    'https://images.unsplash.com/photo-1559339352-11d035aa65de?w=900',
    rating: 4.9,
    location: 'สงขลา',
  ),
  Restaurant(
    name: 'Noodle Garden',
    type: 'ก๋วยเตี๋ยว • อาหารไทย',
    image:
    'https://images.unsplash.com/photo-1559314809-0d155014e29e?w=900',
    rating: 4.4,
    location: 'หาดใหญ่',
  ),
];

final List<FoodItem> foods = [
  FoodItem(
    name: 'ข้าวผัดกุ้ง',
    category: 'อาหารจานเดียว',
    price: 89,
    image:
    'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=600',
    description: 'ข้าวผัดกุ้งหอมกลิ่นกระทะ กุ้งสดตัวโต',
  ),
  FoodItem(
    name: 'ข้าวผัดปู',
    category: 'อาหารจานเดียว',
    price: 99,
    image:
    'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=600',
    description: 'ข้าวผัดปูเนื้อแน่น เสิร์ฟร้อน ๆ',
  ),
  FoodItem(
    name: 'กะเพราไก่',
    category: 'อาหารจานเดียว',
    price: 69,
    image:
    'https://images.unsplash.com/photo-1562565652-a0d8f0c59eb4?w=600',
    description: 'กะเพราไก่รสจัดจ้าน พร้อมข้าวหอมมะลิ',
  ),
  FoodItem(
    name: 'กะเพราหมู',
    category: 'อาหารจานเดียว',
    price: 69,
    image:
    'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=600',
    description: 'หมูสับผัดกะเพรา หอมใบกะเพรา',
  ),
  FoodItem(
    name: 'กะเพราเนื้อ',
    category: 'อาหารจานเดียว',
    price: 89,
    image:
    'https://images.unsplash.com/photo-1547592180-85f173990554?w=600',
    description: 'เนื้อผัดกะเพรารสเข้มข้น',
  ),
  FoodItem(
    name: 'ข้าวมันไก่',
    category: 'อาหารจานเดียว',
    price: 65,
    image:
    'https://images.unsplash.com/photo-1603360946369-dc9bb6258143?w=600',
    description: 'ข้าวมันหอม ๆ พร้อมไก่นุ่ม',
  ),
  FoodItem(
    name: 'ข้าวหมูแดง',
    category: 'อาหารจานเดียว',
    price: 65,
    image:
    'https://images.unsplash.com/photo-1562565652-a0d8f0c59eb4?w=600',
    description: 'หมูแดงนุ่ม ๆ ราดน้ำซอสสูตรพิเศษ',
  ),
  FoodItem(
    name: 'ข้าวหมูกรอบ',
    category: 'อาหารจานเดียว',
    price: 75,
    image:
    'https://images.unsplash.com/photo-1516684732162-798a0062be99?w=600',
    description: 'หมูกรอบหนังกรอบ เนื้อนุ่ม',
  ),
  FoodItem(
    name: 'ผัดไทยกุ้ง',
    category: 'เส้น',
    price: 89,
    image:
    'https://images.unsplash.com/photo-1559314809-0d155014e29e?w=600',
    description: 'ผัดไทยเส้นเหนียวนุ่มพร้อมกุ้งสด',
  ),
  FoodItem(
    name: 'ผัดซีอิ๊วหมู',
    category: 'เส้น',
    price: 69,
    image:
    'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=600',
    description: 'เส้นใหญ่ผัดซีอิ๊วหอมกระทะ',
  ),
  FoodItem(
    name: 'ราดหน้าทะเล',
    category: 'เส้น',
    price: 89,
    image:
    'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=600',
    description: 'ราดหน้าทะเลรวม กุ้ง ปลาหมึก',
  ),
  FoodItem(
    name: 'สุกี้ทะเล',
    category: 'เส้น',
    price: 89,
    image:
    'https://images.unsplash.com/photo-1547592180-85f173990554?w=600',
    description: 'สุกี้ทะเลน้ำซุปเข้มข้น',
  ),
  FoodItem(
    name: 'ต้มยำกุ้ง',
    category: 'ต้ม',
    price: 149,
    image:
    'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=600',
    description: 'ต้มยำกุ้งน้ำข้น รสเปรี้ยวเผ็ด',
  ),
  FoodItem(
    name: 'ต้มยำทะเล',
    category: 'ต้ม',
    price: 159,
    image:
    'https://images.unsplash.com/photo-1455619452474-d2be8b1e70cd?w=600',
    description: 'ต้มยำทะเลรวมรสจัดจ้าน',
  ),
  FoodItem(
    name: 'ต้มข่าไก่',
    category: 'ต้ม',
    price: 129,
    image:
    'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=600',
    description: 'ต้มข่าไก่กะทิหอมมัน',
  ),
  FoodItem(
    name: 'แกงเขียวหวานไก่',
    category: 'แกง',
    price: 129,
    image:
    'https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7?w=600',
    description: 'แกงเขียวหวานไก่กะทิเข้มข้น',
  ),
  FoodItem(
    name: 'แกงมัสมั่นไก่',
    category: 'แกง',
    price: 139,
    image:
    'https://images.unsplash.com/photo-1455619452474-d2be8b1e70cd?w=600',
    description: 'มัสมั่นไก่หอมเครื่องเทศ',
  ),
  FoodItem(
    name: 'แกงพะแนง',
    category: 'แกง',
    price: 139,
    image:
    'https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7?w=600',
    description: 'พะแนงซอสเข้มข้น',
  ),
  FoodItem(
    name: 'ผัดกะเพราทะเล',
    category: 'อาหารจานเดียว',
    price: 109,
    image:
    'https://images.unsplash.com/photo-1559339352-11d035aa65de?w=600',
    description: 'กุ้งและปลาหมึกผัดใบกะเพรา',
  ),
  FoodItem(
    name: 'ผัดคะน้าหมูกรอบ',
    category: 'อาหารจานเดียว',
    price: 89,
    image:
    'https://images.unsplash.com/photo-1516684732162-798a0062be99?w=600',
    description: 'คะน้าสดผัดหมูกรอบ',
  ),
  FoodItem(
    name: 'ไก่ทอด',
    category: 'ของทอด',
    price: 89,
    image:
    'https://images.unsplash.com/photo-1562967914-608f82629710?w=600',
    description: 'ไก่ทอดกรอบนอกนุ่มใน',
  ),
  FoodItem(
    name: 'ปีกไก่ทอด',
    category: 'ของทอด',
    price: 99,
    image:
    'https://images.unsplash.com/photo-1527477396000-e27163b481c2?w=600',
    description: 'ปีกไก่ทอดกรอบ เสิร์ฟพร้อมซอส',
  ),
  FoodItem(
    name: 'หมูทอดกระเทียม',
    category: 'ของทอด',
    price: 89,
    image:
    'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=600',
    description: 'หมูทอดกระเทียมหอม ๆ',
  ),
  FoodItem(
    name: 'กุ้งทอดกระเทียม',
    category: 'ซีฟู้ด',
    price: 149,
    image:
    'https://images.unsplash.com/photo-1559339352-11d035aa65de?w=600',
    description: 'กุ้งสดทอดกระเทียม',
  ),
  FoodItem(
    name: 'ปลาทอดน้ำปลา',
    category: 'ซีฟู้ด',
    price: 179,
    image:
    'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?w=600',
    description: 'ปลาทอดกรอบราดน้ำปลา',
  ),
  FoodItem(
    name: 'ยำวุ้นเส้นทะเล',
    category: 'ยำ',
    price: 129,
    image:
    'https://images.unsplash.com/photo-1559847844-5315695dadae?w=600',
    description: 'ยำวุ้นเส้นทะเลรสแซ่บ',
  ),
  FoodItem(
    name: 'ยำทะเล',
    category: 'ยำ',
    price: 139,
    image:
    'https://images.unsplash.com/photo-1559339352-11d035aa65de?w=600',
    description: 'ยำทะเลรวมรสจัดจ้าน',
  ),
  FoodItem(
    name: 'ส้มตำไทย',
    category: 'ยำ',
    price: 69,
    image:
    'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=600',
    description: 'ส้มตำไทยรสหวานเปรี้ยวเผ็ด',
  ),
  FoodItem(
    name: 'ข้าวเหนียวมะม่วง',
    category: 'ของหวาน',
    price: 89,
    image:
    'https://images.unsplash.com/photo-1623921571714-7f4e9a2c8f8c?w=600',
    description: 'มะม่วงหวานพร้อมข้าวเหนียวมูน',
  ),
  FoodItem(
    name: 'บิงซูสตรอว์เบอร์รี',
    category: 'ของหวาน',
    price: 129,
    image:
    'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=600',
    description: 'บิงซูนมสดพร้อมสตรอว์เบอร์รี',
  ),
];

final List<Restaurant> favorites = [];
final List<Booking> bookings = [];
final List<FoodItem> cart = [];