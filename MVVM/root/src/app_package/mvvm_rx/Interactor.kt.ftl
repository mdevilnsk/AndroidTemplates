package ${packageName}.domain

import rx.Single

//TODO: implement interactor
interface ${featureName}Interactor {

    fun getSmth(force: Boolean = false): Single<String>
}