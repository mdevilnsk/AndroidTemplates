package ru.plamit.mvvm_rx.users_list.domain

import io.reactivex.Single
import io.reactivex.schedulers.Schedulers
import ru.plamit.mvvm_rx.users_list.data.Api
import java.util.concurrent.TimeUnit


class UsersListInteractorImpl(val api: Api) : UsersListInteractor {



    override fun getUsers(force: Boolean): Single<List<User>> {

        if (!force) {
            return api.getUsersList()
        }
        return api.getUsersList().delay(2, TimeUnit.SECONDS).subscribeOn(Schedulers.io())
    }
}