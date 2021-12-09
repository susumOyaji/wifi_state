final Connectivity _connectivity = Connectivity();

ConnectivityResult connectivityResult = await _connectivity.checkConnectivity();

if (connectivityResult == ConnectivityResult.mobile) {
  // I am connected to a mobile network.
} else if (connectivityResult == ConnectivityResult.wifi) {
  // I am connected to a wifi network.
}


StreamSubscription<ConnectivityResult> _connectivitySubscription;


// Initialize a variable with [none] status to avoid nulls at startup
ConnectivityResult connectivityResult = ConnectivityResult.none;

@override
void initState() {
  super.initState();

  _connectivitySubscription =
      _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
}

// Make sure to cancel subscription after you are done
@override
dispose() {
  super.dispose();

  subscription.cancel();
}

Future<void> _updateConnectionStatus(ConnectivityResult result) async {
  setState((){
      _connectionResult = result;
  });
}

