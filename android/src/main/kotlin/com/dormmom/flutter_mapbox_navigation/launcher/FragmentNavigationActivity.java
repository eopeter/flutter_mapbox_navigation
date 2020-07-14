package com.dormmom.flutter_mapbox_navigation.launcher;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;

import com.dormmom.flutter_mapbox_navigation.R;
import com.mapbox.services.android.navigation.ui.v5.NavigationViewOptions;
import com.mapbox.services.android.navigation.v5.navigation.NavigationConstants;


public class FragmentNavigationActivity extends AppCompatActivity {


    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_navigation_fragment);

        FragmentManager fragmentManager = getSupportFragmentManager();
        NavigationFragment fragment = new NavigationFragment();
        FragmentTransaction transaction = fragmentManager.beginTransaction();
        transaction.disallowAddToBackStack();
        transaction.add(R.id.navigation_fragment_frame, fragment).commit();

    }

    @Override
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
    }

    @SuppressLint("RestrictedApi")
    @Override
    protected void onRestoreInstanceState(Bundle savedInstanceState) {
        super.onRestoreInstanceState(savedInstanceState);
    }


    public static void startNavigation(Activity activity, NavigationViewOptions options) {
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(activity);
        SharedPreferences.Editor editor = prefs.edit();

        storeDirectionsRouteValue(options,editor);
        storeConfiguration(options,editor);
        editor.apply();

        Intent intent = new Intent(activity, FragmentNavigationActivity.class);
        activity.startActivityForResult(intent,5029);
    }

    public static void stopNavigation(Activity activity){
        activity.finishActivity(5029);
    }


    private static void storeDirectionsRouteValue(NavigationViewOptions options, SharedPreferences.Editor editor) {
        editor.putString(NavigationConstants.NAVIGATION_VIEW_ROUTE_KEY, options.directionsRoute().toJson());
    }

    private static void storeConfiguration(NavigationViewOptions options, SharedPreferences.Editor editor) {
        editor.putBoolean(NavigationConstants.NAVIGATION_VIEW_SIMULATE_ROUTE, options.shouldSimulateRoute());
    }

}