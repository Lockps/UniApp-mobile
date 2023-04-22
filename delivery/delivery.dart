import 'package:flutter/material.dart';

//หน้าแรก
class HomePageDelivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Delivery App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
              child: Image(
                image: NetworkImage(
                    "https://blog.pttexpresso.com/wp-content/uploads/2019/12/160915-OVG7Z4-732-copy.jpg"),
                fit: BoxFit.contain,
              ),
            ),
            const Text(
              "SWU Delivery App!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            MaterialButton(
              child: const Text(
                "กดเลือกออเดอร์",
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => addressPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class addressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "กรุณาใส่ชื่อและที่อยู่ของคุณ:",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                hintText: 'ชื่อ',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                hintText: 'ที่อยู่',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            MaterialButton(
              child: Text('Submit'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String _selectedStore = 'Select a store';
  String _storeAddress = '';

  final List<String> _storeList = [
    'Select a store',
    'Store 1',
    'Store 2',
    'Store 3',
    'Store 4',
  ];

  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'เลือกร้านค้า:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: _selectedStore,
              onChanged: (value) {
                setState(() {
                  _selectedStore = value!;
                });
              },
              items: _storeList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 32),
            const Text(
              'สิ่งที่คุณต้องการจะซื้อ?:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                hintText: 'ซื้ออะไร',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _storeAddress = value;
                });
              },
            ),
            const SizedBox(height: 32),
            MaterialButton(
              child: Text('Submit Order'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SuccessPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Placed'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.check_circle_outline,
              size: 72,
              color: Colors.green,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            const Text(
              'Your order has been successfully placed!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            MaterialButton(
              child: const Text(
                'เลือกคนขับ',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => RiderPage()),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class RiderPage extends StatelessWidget {
  
// }
