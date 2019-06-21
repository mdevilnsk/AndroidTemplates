package ru.plamit.mvvm_rx.users_list.presentation

import android.annotation.SuppressLint
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import io.reactivex.disposables.Disposable
import ru.plamit.mvvm_rx.users_list.domain.UsersListInteractor

class UsersListViewModel(private val interactor: UsersListInteractor) : ViewModel() {

    val viewState: MutableLiveData<UsersListViewState> = MutableLiveData()
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
    fun getUsers(force: Boolean = false) {
        addSubscription(
            interactor.getUsers(force).subscribe({
                viewState.postValue(UsersListViewState(value = it))
            }, {
                viewState.postValue(UsersListViewState(error = it))
            })
        )
    }
}