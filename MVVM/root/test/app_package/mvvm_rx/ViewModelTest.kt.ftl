package ${packageName}.presentation

import androidx.arch.core.executor.testing.InstantTaskExecutorRule
import androidx.lifecycle.Observer
<#if includeInteractors>
import rx.Single
import ${packageName}.domain.${featureName}Interactor
import org.mockito.ArgumentMatchers.anyBoolean
</#if>
import org.junit.After
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TestRule
import org.junit.runner.RunWith
import org.mockito.Mockito.*
import org.mockito.junit.MockitoJUnitRunner

@Suppress("UNCHECKED_CAST")
@RunWith(MockitoJUnitRunner::class)
class ${featureName}ViewModelTest {
    @get:Rule
    var rule: TestRule = InstantTaskExecutorRule()

    private lateinit var viewModel: ${featureName}ViewModel
    <#if includeInteractors>
    private val interactor = mock(${featureName}Interactor::class.java)
    </#if>
    private val viewStateObserver = mock(
        Observer::class.java
        //            , Mockito.withSettings().verboseLogging() //uncomment to get logging of vm observer
    ) as Observer<${featureName}ViewState>

    @Before
    fun setUp() {
        viewModel = ${featureName}ViewModel(<#if includeInteractors>interactor</#if>)
    }

    @After
    fun tearDown() {
    <#if includeInteractors>
        verifyNoMoreInteractions(interactor)
    </#if>
        verifyNoMoreInteractions(viewStateObserver)
    }

    @Test
    fun `should return success`() {
        //precondition
    <#if includeInteractors>
        `when`(interactor.getSmth(anyBoolean())).thenReturn(Single.just("success"))
    <#else>
        //TODO: write your precondition, forexample
        //`when`(interactor.getSmth(anyBoolean())).thenReturn(Single.just("success"))
    </#if>

        //action
        viewModel.viewState.observeForever(viewStateObserver)
        viewModel.getSmth()

        //result
        <#if includeInteractors>
        verify(interactor).getSmth()
        </#if>
        verify(viewStateObserver).onChanged(
            ${featureName}Result("success")
        )
    }

    @Test
    fun `should return error`() {
        //precondition
         <#if includeInteractors>
        val error = Throwable("error")
        `when`(interactor.getSmth(anyBoolean())).thenReturn(Single.error(error))
        <#else>
            //TODO: write your precondition, forexample
            // `when`(interactor.getSmth(anyBoolean())).thenReturn(Single.error(error))
        </#if>


        //action
        viewModel.viewState.observeForever(viewStateObserver)
        viewModel.getSmth()

        //result
        <#if includeInteractors>
        verify(interactor).getSmth()
        </#if>
        verify(viewStateObserver).onChanged(
        <#if includeInteractors>
            ${featureName}ResultError
        <#else>
            ${featureName}Result("success")
        </#if>
        )
    }

}