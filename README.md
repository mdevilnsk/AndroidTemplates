# AndroidTemplates
Android templates for creating feature

#### Kotlin MVVM + RX (androidX)
This module creates
1. empty layout
2. Fragment
3. ViewModel + unitTest
4. Interactor with interface + unitTest

For install module on Mac OS use install.sh
After install You need to restart Android Studio

This template uses 
1. RxJava (https://github.com/ReactiveX/RxJava)
2. Android ViewModel + LiveData (https://developer.android.com/topic/libraries/architecture)
3. Koin + Koin ViewModel (https://github.com/InsertKoinIO/koin)
4. Mockito (https://site.mockito.org)

You can import all libraries in your gradle from code below

     //Koin
     implementation "org.koin:koin-core:2.0.0-GA4"
     implementation "org.koin:koin-android:2.0.0-GA4"
     implementation "org.koin:koin-androidx-viewmodel:2.0.0-GA4"
         
     
     //Rx
     implementation "io.reactivex.rxjava2:rxjava:2.2.8"
     implementation "io.reactivex.rxjava2:rxandroid:2.1.1"
 
     //MVVM Android arch. components
     implementation "androidx.lifecycle:lifecycle-extensions:2.0.0"
 
     //testing
     testImplementation "junit:junit:4.12"
     testImplementation "org.mockito:mockito-core:2.24.5"
     testImplementation 'androidx.arch.core:core-testing:2.0.1'
     
 Creating new feature is very simple
 1. select new MVVM+Rx fragment from CleanArchitecture
 ![alt text](https://raw.githubusercontent.com/mdevilnsk/AndroidTemplates/master/images/selection.png)
 2. Input Feature name
 ![alt text](https://raw.githubusercontent.com/mdevilnsk/AndroidTemplates/master/images/new_feature.png)
