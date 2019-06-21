package ru.plamit.mvvm_rx

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import org.koin.core.context.startKoin
import ru.plamit.mvvm_rx.di.appModule

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        startKoin { modules(appModule) }
        setContentView(R.layout.activity_main)
    }
}
