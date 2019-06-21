package ru.plamit.mvvm_rx.users_list.data

import io.reactivex.Single
import ru.plamit.mvvm_rx.users_list.domain.User

class ApiImpl: Api{
    override fun getUsersList(): Single<List<User>> = Single.just(arrayListOf(
        User("https://avatars0.githubusercontent.com/u/89368?v=4", "berekuk"),
        User("https://avatars2.githubusercontent.com/u/228687?v=4", "tadam"),
        User("https://avatars0.githubusercontent.com/u/485405?v=4", "spoterianski"),
        User("https://avatars0.githubusercontent.com/u/169976?v=4", "SaveTheRbtz"),
        User("https://avatars0.githubusercontent.com/u/3453148?v=4", "linux-unix"),
        User("https://avatars0.githubusercontent.com/u/3106773?v=4", "bockra"),
        User("https://avatars0.githubusercontent.com/u/222429?v=4", "dsqmoore"),
        User("https://avatars0.githubusercontent.com/u/429706?v=4", "podviaznikov"),
        User("https://avatars0.githubusercontent.com/u/171481?v=4", "jpetazzo"),
        User("https://avatars0.githubusercontent.com/u/526959?v=4", "trietptm"),
        User("https://avatars0.githubusercontent.com/u/375543?v=4", "beebeeep")
    ))
}