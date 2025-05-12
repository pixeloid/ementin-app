import java.util.Properties
import java.io.FileInputStream


plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.onesignal.androidsdk.onesignal-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.pixeloid.eventapp"
    compileSdk = 35

    defaultConfig {
        applicationId = "com.pixeloid.eventapp"
        minSdk = 21
        targetSdk = 34
        versionCode = 125  // 🔁 Update this automatically via script if desired
        versionName = "1.4.11"

        multiDexEnabled = true
    }

    buildTypes {
        release {
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }


    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String
            keyPassword = keystoreProperties["keyPassword"] as String
            storeFile = keystoreProperties["storeFile"]?.let { file(it) }
            storePassword = keystoreProperties["storePassword"] as String
        }
    }
    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now,
            // so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
            signingConfig = signingConfigs.getByName("release")
        }
    }

    flavorDimensions += "env"
    productFlavors {
        create("dev") {
            dimension = "env"
            applicationIdSuffix = ".dev"
            versionNameSuffix = "-dev"
        }
        create("prod") {
            dimension = "env"
        }
    }

}

flutter {
    source = "../.."
}


afterEvaluate {
    tasks.named("assembleDevDebug").configure {
        doLast {
            val apkSource = file("build/outputs/apk/dev/debug/app-dev-debug.apk")
            val flutterExpectedDir = file("../../build/app/outputs/flutter-apk")
            val flutterExpectedApk = File(flutterExpectedDir, "app-dev-debug.apk") // ✅ the key fix

            if (apkSource.exists()) {
                flutterExpectedDir.mkdirs()
                apkSource.copyTo(flutterExpectedApk, overwrite = true)
                println("✅ Copied APK to ${flutterExpectedApk.path}")
            } else {
                println("❌ APK not found at ${apkSource.path}")
            }
        }
    }
}
