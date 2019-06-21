package ru.plamit.mvvm_rx.users_list.presentation.adapter

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import kotlinx.android.synthetic.main.item_user_layout.view.*
import ru.plamit.mvvm_rx.R
import ru.plamit.mvvm_rx.users_list.domain.User

class UsersAdapter(
    private val users: MutableList<User>, private val listener: (position: Int) -> Unit
) : RecyclerView.Adapter<UsersAdapter.UserViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): UserViewHolder {
        val itemView = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_user_layout, parent, false)
        return UserViewHolder(itemView)
    }

    fun setUsers(newUsers: List<User>){
        users.clear()
        users.addAll(newUsers)
        notifyDataSetChanged()
    }

    override fun getItemCount() = users.size

    override fun onBindViewHolder(holder: UserViewHolder, position: Int) {
        Glide.with(holder.itemView)
            .load(users[position].picUrl)
            .into(holder.itemView.imageProfile)

        holder.itemView.setOnClickListener {
            listener(position)
        }
        holder.itemView.textProfile.text = users[position].name
    }

    class UserViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {

    }
}