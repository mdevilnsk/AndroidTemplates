package ${packageName}.presentation

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import org.koin.androidx.viewmodel.ext.android.viewModel
import kotlinx.android.synthetic.main.fragment_${classToResource(featureName)}.*

class ${featureName}Fragment : Fragment() {

    private val featureViewModel: ${featureName}ViewModel by viewModel()

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_${classToResource(featureName)}, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        featureViewModel.getViewState().observe(this, Observer { response ->
            if (response.error != null) {
                //TODO: show error
            } else {
                //TODO: show success response
            }
        })

        featureViewModel.getSmth(true)
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