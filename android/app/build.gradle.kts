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
        targetSdk = 35
        versionCode = flutter.versionCode
        versionName = flutter.versionName

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
        if (keystorePropertiesFile.exists()) {
            create("release") {
                keyAlias = keystoreProperties["keyAlias"] as String
                keyPassword = keystoreProperties["keyPassword"] as String
                storeFile = keystoreProperties["storeFile"]?.let { file(it) }
                storePassword = keystoreProperties["storePassword"] as String
            }
        }
    }
    buildTypes {
        release {
            // Use release signing config if available, otherwise use debug
            if (keystorePropertiesFile.exists()) {
                signingConfig = signingConfigs.getByName("release")
            } else {
                signingConfig = signingConfigs.getByName("debug")
            }
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

    tasks.named("bundleProdRelease").configure {
        doLast {
            val aabSource = file("build/outputs/bundle/prodRelease/app-prod-release.aab")
            val flutterExpectedDir = file("../../build/app/outputs/bundle/prodRelease")
            val flutterExpectedAab = File(flutterExpectedDir, "app-prod-release.aab")

            if (aabSource.exists()) {
                flutterExpectedDir.mkdirs()
                aabSource.copyTo(flutterExpectedAab, overwrite = true)
                println("✅ Copied AAB to ${flutterExpectedAab.path}")
            } else {
                println("❌ AAB not found at ${aabSource.path}")
            }
        }
    }
}
