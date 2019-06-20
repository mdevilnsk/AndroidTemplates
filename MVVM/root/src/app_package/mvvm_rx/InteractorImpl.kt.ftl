package ${packageName}.domain

import io.reactivex.Single
import io.reactivex.schedulers.Schedulers
import java.util.concurrent.TimeUnit

//TODO: implement interactor
class ${featureName}InteractorImpl() : ${featureName}Interactor {

    override fun getSmth(force: Boolean): Single<String> {

        if (!force) {
            return Single.just("success")
        }
        return Single.just("success").delay(2, TimeUnit.SECONDS).subscribeOn(Schedulers.io())
    }
}