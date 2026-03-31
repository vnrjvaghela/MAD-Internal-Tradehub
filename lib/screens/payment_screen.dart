import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:tradehub/theme/app_theme.dart';
import 'package:tradehub/models/product.dart';

class PaymentScreen extends StatefulWidget {
  final Product product;

  const PaymentScreen({super.key, required this.product});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
                                        content: Text('Payment Successful! Order placed. (ID: ${response.paymentId})'),
        backgroundColor: AppTheme.teal,
      ),
    );
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Payment Failed: ${response.message}'),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('External Wallet Selected: ${response.walletName}'),
      ),
    );
  }

  void openCheckout() async {
    // Convert price to paise (multiply by 100)
    final amountInPaise = (widget.product.price * 100).toInt();
    
    var options = {
      'key': 'rzp_test_SXn7tsrUAndTPT',
      'amount': amountInPaise,
      'name': 'TradeHub Platform',
      'description': 'Payment for ${widget.product.title}',
      'prefill': {
        'contact': '9876543210',
        'email': 'student@tradehub.com'
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Secure Checkout')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order Summary', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: Image.network(widget.product.imageUrl, width: 50, height: 50, fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.image),
                ),
                title: Text(widget.product.title),
                subtitle: Text('Seller: ${widget.product.sellerName}'),
                trailing: Text('₹${widget.product.price.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
            const SizedBox(height: 32),
            Text('Payment Method (Razorpay)', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.payment, color: AppTheme.navyBlue),
              title: const Text('Razorpay (UPI, Netbanking, Cards)'),
              trailing: const Icon(Icons.check_circle, color: AppTheme.teal),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: AppTheme.teal, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 32),
            Card(
              color: AppTheme.backgroundColor,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.verified_user, color: AppTheme.teal),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text('TradeHub Escrow Protection: Funds are safely processed via Razorpay.'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: openCheckout,
                child: Text('Pay ₹${widget.product.price.toStringAsFixed(0)} Securely'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
