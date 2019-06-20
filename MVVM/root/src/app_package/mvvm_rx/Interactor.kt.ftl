package ${packageName}.domain

import io.reactivex.Single

//TODO: implement interactor
interface ${featureName}Interactor {

    fun getSmth(force: Boolean = false): Single<String>
}