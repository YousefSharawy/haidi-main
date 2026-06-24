allprojects {
    repositories {
        google()
        mavenCentral()
    }
    // flutter_google_places_sdk_android 0.2.2's Kotlin uses old Place fields
    // (userRatingsTotal/placeTypes) that the native SDK's default 5.1.1 renamed.
    // Pin the native Places SDK to a 3.x version that still has them.
    configurations.all {
        resolutionStrategy {
            force("com.google.android.libraries.places:places:3.5.0")
        }
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
