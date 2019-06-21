package ru.plamit.mvvm_rx.users_list.data

import io.reactivex.Single
import ru.plamit.mvvm_rx.users_list.domain.User

interface Api {
    fun getUsersList(): Single<List<User>>
}