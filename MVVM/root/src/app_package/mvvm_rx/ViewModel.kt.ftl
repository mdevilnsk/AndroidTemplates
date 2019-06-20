package ${packageName}.presentation

import android.annotation.SuppressLint
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import io.reactivex.disposables.Disposable
import ${packageName}.domain.FeatureNameInteractor

class ${featureName}ViewModel(private val interactor: ${featureName}Interactor) : ViewModel() {

    val viewState: MutableLiveData<${featureName}ViewState> = MutableLiveData()
    val disposables: MutableList<Disposable> = ArrayList()

    fun addSubscription(disposable: Disposable) {
        disposables.add(disposable)
    }

    override fun onCleared() {
        super.onCleared()
        disposables.forEach { it.dispose() }
        disposables.clear()
    }

    @SuppressLint("CheckResult")
    //TODO: implement your logic
    fun getSmth(force: Boolean = false) {
        addSubscription(
            interactor.getSmth(force).subscribe({
                viewState.postValue(${featureName}ViewState(value = it))
            }, {
                viewState.postValue(${featureName}ViewState(error = it))
            })
        )
    }
}