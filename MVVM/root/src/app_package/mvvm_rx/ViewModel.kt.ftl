package ${packageName}.presentation

import android.annotation.SuppressLint
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import ru.pochtabank.ui.base.mvvm.BaseViewModel
 <#if includeInteractors>
import ${packageName}.domain.${featureName}Interactor
import ru.pochtabank.ui.base.mvvm.BaseViewModel

</#if>

class ${featureName}ViewModel(<#if !includeInteractors>): BaseViewModel() {
<#else>
    private val interactor: ${featureName}Interactor
) : BaseViewModel() {
</#if>

    private val viewStateData: MutableLiveData<${featureName}ViewState> = MutableLiveData()

    val viewState: LiveData<${featureName}ViewState>
        get() = viewStateData

    @SuppressLint("CheckResult")
    //TODO: implement your logic.
    fun getSmth(force: Boolean = false) {
        <#if includeInteractors>
        subscriptions.add(
            interactor.getSmth(force).subscribe({
                viewStateData.postValue(${featureName}Result(value = it))
            }, {
                viewStateData.postValue(${featureName}ResultError)
            })
        )
        <#else>
            //TODO: You can add RX subscription with function addSubscription()
            viewStateData.postValue(${featureName}Result(value = "success"))
        </#if>

    }
}