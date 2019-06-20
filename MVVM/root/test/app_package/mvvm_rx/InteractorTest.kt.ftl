package ${packageName}

import org.junit.After
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.junit.MockitoJUnitRunner

@Suppress("NonAsciiCharacters", "UNCHECKED_CAST")
@RunWith(MockitoJUnitRunner::class)
class ${featureName}InteractorTest {

    private lateinit var interactor: ${featureName}Interactor

    @Before
    fun setUp() {
        interactor = ${featureName}InteractorImpl()
    }

    @After
    fun tearDown() {
        //verifyNoMoreInteractions()
    }

    @Test
    fun `implement me`() {
        //precondition

        //action
        val testObserver = interactor.getSmth(false).test()

        //result
        testObserver.assertValue("success")
        testObserver.assertNoErrors()
        testObserver.assertComplete()
    }

    @Test
    fun `implement error`() {
        //precondition

        //action

        //result

    }
}