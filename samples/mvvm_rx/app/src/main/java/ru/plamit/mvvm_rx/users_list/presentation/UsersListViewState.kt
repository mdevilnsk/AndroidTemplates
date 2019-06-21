package ru.plamit.mvvm_rx.users_list.presentation

import ru.plamit.mvvm_rx.users_list.domain.User

data class UsersListViewState(val value: List<User>? = null, val error: Throwable? = null)