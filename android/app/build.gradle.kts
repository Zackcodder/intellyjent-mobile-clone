plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("dev.flutter.flutter-gradle-plugin")
}

import java.util.Properties
import java.io.FileInputStream

// val keystoreProperties = Properties()
// val keystorePropertiesFile = rootProject.file("key.properties")

// if (keystorePropertiesFile.exists()) {
    // keystoreProperties.load(FileInputStream(keystorePropertiesFile))
// }
val keystorePropertiesFile = rootProject.file("key.properties")
val keystoreProperties = Properties().apply {
    if (keystorePropertiesFile.exists()) {
        load(FileInputStream(keystorePropertiesFile))
    }
}
android {
    namespace = "com.intellyjent.intellyjent"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "29.0.0"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    defaultConfig {
        applicationId = "com.intellyjent.intellyjent"
        minSdk = flutter.minSdkVersion
        targetSdk = 34
        versionCode = 55
        versionName = "4.8.8"
    }

    signingConfigs {
        create("release") {
            // keyAlias = keystoreProperties["keyAlias"] as String
            // keyPassword = keystoreProperties["keyPassword"] as String
            // storeFile = file(keystoreProperties["storeFile"] as String)
            // storePassword = keystoreProperties["storePassword"] as String
            keyAlias = keystoreProperties.getProperty("keyAlias")
            keyPassword = keystoreProperties.getProperty("keyPassword")
            storeFile = file(keystoreProperties.getProperty("storeFile"))
            storePassword = keystoreProperties.getProperty("storePassword")
        }
    }

    buildTypes {
        getByName("debug") {
            // Flutter automatically uses the debug keystore
            isMinifyEnabled = false
            isShrinkResources = false
        }

        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = false
            isShrinkResources = false
        }
    }

    lint {
        abortOnError = false
        checkReleaseBuilds = false
    }
}

flutter {
    source = "../.."
}
