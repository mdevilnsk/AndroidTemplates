package ru.plamit.mvvm_rx.users_list.domain

import io.reactivex.Single
import org.junit.After
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.Mockito.*
import org.mockito.junit.MockitoJUnitRunner
import ru.plamit.mvvm_rx.users_list.data.Api

@Suppress("NonAsciiCharacters", "UNCHECKED_CAST")
@RunWith(MockitoJUnitRunner::class)
class UsersListInteractorTest {

    private lateinit var interactor: UsersListInteractor
    private val apiMock = mock(Api::class.java)

    @Before
    fun setUp() {
        interactor = UsersListInteractorImpl(apiMock)
    }

    @After
    fun tearDown() {
        verifyNoMoreInteractions(apiMock)
    }

    @Test
    fun `success result`() {
        //precondition
        `when`(apiMock.getUsersList()).thenReturn(Single.just(generateUserList()))
        //action
        val testObserver = interactor.getUsers(false).test()

        //result
        verify(apiMock).getUsersList()
        testObserver.assertValue(generateUserList())
        testObserver.assertNoErrors()
        testObserver.assertComplete()
    }

    @Test
    fun `error result cannot implement`() {
        //precondition
        val error = Throwable("error")
        `when`(apiMock.getUsersList()).thenReturn(Single.error(error))
        //action
        val testObserver = interactor.getUsers(false).test()

        //result
        verify(apiMock).getUsersList()
        testObserver.assertError(error)
    }

    private fun generateUserList() = arrayListOf(
        User("url1", "name1"),
        User("url2", "name2"),
        User("url3", "name3")
    )
}