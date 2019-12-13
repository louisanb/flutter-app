import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;


// IOWebSocketChannel channel;
//     try {
//       channel = new IOWebSocketChannel.connect(
//                   "wss://192.168.1.25:443/svc/websockets",
//                   headers: {
//                     'X-DEVICE-ID': deviceIdentity,
//                     'X-TOKEN': token,
//                     'X-APP-ID': applicationId,
//                   });
//     } catch(e){
//       ///
//       /// An error occurred
//       ///
//     }
// final channel = IOWebSocketChannel.connect(
//                   "wss://192.168.1.25:443/svc/websockets",
//                   headers: {
//                     'X-DEVICE-ID': deviceIdentity,
//                     'X-TOKEN': token,
//                     'X-APP-ID': applicationId,
//                 });
const SOCKET_URL = TEST
  ? "ws://54.183.150.155:8082"
  : "wss://api.sevenbuddies.com";
export { SOCKET_URL };

