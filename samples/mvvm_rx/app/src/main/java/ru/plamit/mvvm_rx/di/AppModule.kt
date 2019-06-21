package ru.plamit.mvvm_rx.di

import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.dsl.module
import ru.plamit.mvvm_rx.users_list.data.Api
import ru.plamit.mvvm_rx.users_list.data.ApiImpl
import ru.plamit.mvvm_rx.users_list.domain.UsersListInteractor
import ru.plamit.mvvm_rx.users_list.domain.UsersListInteractorImpl
import ru.plamit.mvvm_rx.users_list.presentation.UsersListViewModel

val appModule = module {
    single { ApiImpl() as Api }
    single { UsersListInteractorImpl(get()) as UsersListInteractor}

    viewModel { UsersListViewModel(get()) }
}