# Keep TypeToken with generic types
-keepattributes Signature
-keepclassmembers,allowobfuscation class * {
    *** *;
}

# Keep all class members of ScheduledNotificationReceiver and related classes
-keep class com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver { *; }
-keep class d5.a { *; } 
