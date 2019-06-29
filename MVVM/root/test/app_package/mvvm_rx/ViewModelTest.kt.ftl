package ${packageName}.presentation

import androidx.arch.core.executor.testing.InstantTaskExecutorRule
import androidx.lifecycle.Observer
import io.reactivex.Single
import ${packageName}.domain.${featureName}Interactor
import org.junit.After
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TestRule
import org.junit.runner.RunWith
import org.mockito.ArgumentMatchers.anyBoolean
import org.mockito.Mockito.*
import org.mockito.junit.MockitoJUnitRunner

@Suppress("UNCHECKED_CAST")
@RunWith(MockitoJUnitRunner::class)
class ${featureName}ViewModelTest {
    @get:Rule
    var rule: TestRule = InstantTaskExecutorRule()

    private lateinit var viewModel: ${featureName}ViewModel
    private val interactor = mock(${featureName}Interactor::class.java)
    private val viewStateObserver = mock(
        Observer::class.java
        //            , Mockito.withSettings().verboseLogging() //uncomment to get logging of vm observer
    ) as Observer<${featureName}ViewState>

    @Before
    fun setUp() {
        viewModel = ${featureName}ViewModel(interactor)
    }

    @After
    fun tearDown() {
        verifyNoMoreInteractions(interactor)
        verifyNoMoreInteractions(viewStateObserver)
    }

    @Test
    fun `should return success`() {
        //precondition
        `when`(interactor.getSmth(anyBoolean())).thenReturn(Single.just("success"))

        //action
        viewModel.getViewState().observeForever(viewStateObserver)
        viewModel.getSmth()

        //result
        verify(interactor).getSmth()
        verify(viewStateObserver).onChanged(
            ${featureName}ViewState("success", null)
        )
    }

    @Test
    fun `should return error`() {
        //precondition
        val error = Throwable("error")
        `when`(interactor.getSmth(anyBoolean())).thenReturn(Single.error(error))

        //action
        viewModel.getViewState().observeForever(viewStateObserver)
        viewModel.getSmth()

        //result
        verify(interactor).getSmth()
        verify(viewStateObserver).onChanged(
            ${featureName}ViewState(null, error)
        )
    }
}