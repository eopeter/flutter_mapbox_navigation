package com.dormmom.flutter_mapbox_navigation.launcher;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;

import com.mapbox.services.android.navigation.ui.v5.MapboxNavigationActivity;

public class MyMapboxNavigationActivity extends MapboxNavigationActivity {

    BroadcastReceiver receiver;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        receiver = new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {
                finish();
                MyNavigationLauncher.cleanUpPreferences(getApplicationContext());
            }
        };
        registerReceiver(receiver, new IntentFilter(MyNavigationLauncher.KEY_STOP_NAVIGATION));
        super.onCreate(savedInstanceState);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        unregisterReceiver(receiver);
    }
}

