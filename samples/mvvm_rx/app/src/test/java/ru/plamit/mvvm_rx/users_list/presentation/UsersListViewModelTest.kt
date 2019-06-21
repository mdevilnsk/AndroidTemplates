package ru.plamit.mvvm_rx.users_list.presentation

import androidx.arch.core.executor.testing.InstantTaskExecutorRule
import androidx.lifecycle.Observer
import io.reactivex.Single
import ru.plamit.mvvm_rx.users_list.domain.UsersListInteractor
import org.junit.After
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TestRule
import org.junit.runner.RunWith
import org.mockito.ArgumentMatchers.anyBoolean
import org.mockito.Mockito.*
import org.mockito.junit.MockitoJUnitRunner
import ru.plamit.mvvm_rx.users_list.domain.User

@Suppress("UNCHECKED_CAST")
@RunWith(MockitoJUnitRunner::class)
class UsersListViewModelTest {
    @get:Rule
    var rule: TestRule = InstantTaskExecutorRule()

    private lateinit var viewModel: UsersListViewModel
    private val interactor = mock(UsersListInteractor::class.java)
    private val viewStateObserver = mock(
        Observer::class.java
        //            , Mockito.withSettings().verboseLogging() //uncomment to get logging of vm observer
    ) as Observer<UsersListViewState>

    @Before
    fun setUp() {
        viewModel = UsersListViewModel(interactor)
    }

    @After
    fun tearDown() {
        verifyNoMoreInteractions(interactor)
        verifyNoMoreInteractions(viewStateObserver)
    }

    @Test
    fun `should return success`() {
        //precondition
        `when`(interactor.getUsers(anyBoolean())).thenReturn(Single.just(generateUserList()))

        //action
        viewModel.viewState.observeForever(viewStateObserver)
        viewModel.getUsers()

        //result
        verify(interactor).getUsers()
        verify(viewStateObserver).onChanged(
            UsersListViewState(generateUserList(), null)
        )
    }

    @Test
    fun `should return error`() {
        //precondition
        val error = Throwable("error")
        `when`(interactor.getUsers(anyBoolean())).thenReturn(Single.error(error))

        //action
        viewModel.viewState.observeForever(viewStateObserver)
        viewModel.getUsers()

        //result
        verify(interactor).getUsers()
        verify(viewStateObserver).onChanged(
            UsersListViewState(null, error)
        )
    }

    private fun generateUserList() = arrayListOf(
        User("url1", "name1"),
        User("url2", "name2"),
        User("url3", "name3")
    )
}