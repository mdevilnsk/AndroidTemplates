package ru.plamit.mvvm_rx.users_list.domain

import io.reactivex.Single
import ru.plamit.mvvm_rx.users_list.data.Api

interface UsersListInteractor {
    fun getUsers(force: Boolean = false): Single<List<User>>
}