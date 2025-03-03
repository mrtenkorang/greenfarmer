var rememberMe = false.obs;
  var loading = false.obs;

  void toggleLoading(bool value) {
    loading.value = value;
    update(); // Notify listeners to rebuild
  }

  void toggleRememberMe(bool value) {
    rememberMe.value = value;
    print("VALUE: ${rememberMe.value}");
    update(); // Notify listeners to rebuild
  }