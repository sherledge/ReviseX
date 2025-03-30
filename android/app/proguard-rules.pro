# Keep SQLite3 Flutter Libs
-keep class eu.simonbinder.sqlite3_flutter_libs.** { *; }

# Keep Path Provider Plugin
-keep class io.flutter.plugins.pathprovider.** { *; }

# Keep TensorFlow Lite classes
-dontwarn org.tensorflow.lite.gpu.GpuDelegateFactory$Options$GpuBackend
-dontwarn org.tensorflow.lite.gpu.GpuDelegateFactory$Options
-keep class org.tensorflow.lite.gpu.GpuDelegateFactory$Options { *; }
-keep class org.tensorflow.lite.gpu.GpuDelegateFactory$Options$GpuBackend { *; }
-keep class org.tensorflow.lite.gpu.GpuDelegate { *; }