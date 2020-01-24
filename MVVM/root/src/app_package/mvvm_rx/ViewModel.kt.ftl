package ${packageName}.presentation

import android.annotation.SuppressLint
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import io.reactivex.disposables.Disposable
import io.reactivex.disposables.CompositeDisposable
 <#if includeInteractors>
import ${packageName}.domain.${featureName}Interactor
</#if>

class ${featureName}ViewModel(<#if !includeInteractors>): ViewModel() {
<#else>
    private val interactor: ${featureName}Interactor
) : ViewModel() {
</#if>

    private val viewStateData: MutableLiveData<${featureName}ViewState> = MutableLiveData()
    val disposables: CompositeDisposable = CompositeDisposable()

    fun getViewState(): LiveData<${featureName}ViewState> = viewStateData

    fun addSubscription(disposable: Disposable) {
        disposables.add(disposable)
    }

    override fun onCleared() {
        super.onCleared()
        disposables.clear()
    }

    @SuppressLint("CheckResult")
    //TODO: implement your logic.
    fun getSmth(force: Boolean = false) {
        <#if includeInteractors>
        addSubscription(
            interactor.getSmth(force).subscribe({
                viewStateData.postValue(${featureName}ViewState(value = it))
            }, {
                viewStateData.postValue(${featureName}ViewState(error = it))
            })
        )
        <#else>
            //TODO: You can add RX subscription with function addSubscription()
            viewStateData.postValue(${featureName}ViewState(value = it))
        </#if>

    }
}