// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../controllers/service_request_controller.dart';
// import '../../models/service_request.dart';

// class RequestDetailScreen extends StatelessWidget {
//   final String requestId;

//   const RequestDetailScreen({super.key, required this.requestId});

//   @override
//   Widget build(BuildContext context) {
//     final ServiceRequestController _controller = Get.find();
//     final ServiceRequest request = _controller.requests.firstWhere(
//     (req) => req.id == requestId,
//     orElse: () => ServiceRequest(
//       // Provide default values here
//       providerId: '',
//       serviceId: '',
//       status: '',
//       location: '',
//       providerName: '',
//       requestTime: DateTime.now(),
//     ),
//   );


//     if (request == null) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Request Detail'),
//         ),
//         body: Center(
//           child: Text('Request not found!'),
//         ),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Request Detail'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Status: ${request.status}'),
//             Text('Location: ${request.location}'),
//             Text('Provider: ${request.providerName}'),
//             Text('Request Time: ${request.requestTime.toString()}'),
//             SizedBox(height: 20),
//             if (request.status == 'pending')
//               ElevatedButton(
//                 onPressed: () {
//                   // Implement cancel logic
//                 },
//                 child: Text('Cancel Request'),
//               ),
//             if (request.status == 'completed')
//               ElevatedButton(
//                 onPressed: () {
//                   // Implement approve logic
//                 },
//                 child: Text('Approve Request'),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
