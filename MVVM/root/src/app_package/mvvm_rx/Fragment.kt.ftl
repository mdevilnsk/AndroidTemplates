package ${packageName}.presentation

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import org.koin.androidx.viewmodel.ext.android.viewModel
import kotlinx.android.synthetic.main.fragment_${classToResource(featureName)}.*
import ru.pochtabank.ui.base.mvvm.BaseMvvmFragment

class ${featureName}Fragment : BaseMvvmFragment(R.layout.fragment_${classToResource(featureName)) {

    override val viewModel: ${featureName}ViewModel by viewModel()

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        viewModel.viewState.observe(this, Observer { response ->
            when(response){
                is ${featureName}ResultError -> {} //TODO: show error
                is ${featureName}Result -> {} //TODO: show success response
            }
        })

        viewModel.getSmth(true)
    }

    //TODO: Write your code here

    companion object {

        @JvmStatic
        fun createFragment(bundle: Bundle): ${featureName}Fragment = ${featureName}Fragment().apply {
            arguments = bundle
        }

        @JvmStatic
        fun buildExtras(): Bundle = Bundle().apply {
            //TODO: put some extra
        }
    }
}