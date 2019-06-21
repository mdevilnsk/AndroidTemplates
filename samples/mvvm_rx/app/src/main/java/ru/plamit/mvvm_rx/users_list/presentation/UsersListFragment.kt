package ru.plamit.mvvm_rx.users_list.presentation

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import org.koin.androidx.viewmodel.ext.android.viewModel
import kotlinx.android.synthetic.main.fragment_users_list.*
import ru.plamit.mvvm_rx.R
import ru.plamit.mvvm_rx.users_list.domain.User
import ru.plamit.mvvm_rx.users_list.presentation.adapter.UsersAdapter

class UsersListFragment : Fragment() {

    private val featureViewModel: UsersListViewModel by viewModel()

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_users_list, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        layoutRefresh.setOnRefreshListener {
            featureViewModel.getUsers(true)
        }


        featureViewModel.viewState.observe(this, Observer { response ->
            if (response.error != null) {
                layoutRefresh.isRefreshing = false
                Toast.makeText(context, "ERROR LOADING USERS", Toast.LENGTH_LONG).show()
            } else {
                layoutRefresh.isRefreshing = false
                response.value?.let { showUsers(it) }
            }
        })

        featureViewModel.getUsers(true)

        usersListRecyclerView.layoutManager = LinearLayoutManager(context, RecyclerView.VERTICAL, false)
        usersListRecyclerView.adapter = UsersAdapter(ArrayList()){
            Toast.makeText(context, "Pressed item on position $it", Toast.LENGTH_SHORT).show()
        }
    }


    private fun showUsers(users: List<User>) {
        (usersListRecyclerView.adapter as UsersAdapter).setUsers(users)
    }

    companion object {

        @JvmStatic
        fun createFragment(bundle: Bundle): UsersListFragment = UsersListFragment().apply {
            arguments = bundle
        }

        @JvmStatic
        fun buildExtras(): Bundle = Bundle().apply {

        }
    }
}