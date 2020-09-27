package com.dormmom.flutter_mapbox_navigation.activity

import android.os.Bundle
import androidx.annotation.Nullable
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.FragmentManager
import androidx.fragment.app.FragmentTransaction
import com.dormmom.flutter_mapbox_navigation.R

class NavigationFragmentActivity : AppCompatActivity(){
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        initializeNavigationViewFragment(savedInstanceState);
    }

    private fun initializeNavigationViewFragment(@Nullable savedInstanceState: Bundle?) {
        val fragmentManager: FragmentManager = supportFragmentManager
        if (savedInstanceState == null) {
            val transaction: FragmentTransaction = fragmentManager.beginTransaction()
            transaction.disallowAddToBackStack()
            transaction.add(R.id.navigation_fragment_frame, NavigationFragment()).commit()
        }
    }
}