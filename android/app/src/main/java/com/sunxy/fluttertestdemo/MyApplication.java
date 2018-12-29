package com.sunxy.fluttertestdemo;

import android.util.Log;

import io.flutter.app.FlutterApplication;

/**
 * SunXiaoYu on 2018/12/29.
 * mail: sunxiaoyu@hexinpass.com
 */
public class MyApplication extends FlutterApplication {

    @Override
    public void onCreate() {
        super.onCreate();
        Log.v("sunxy--", "MyApplication onCreate");
    }
}
