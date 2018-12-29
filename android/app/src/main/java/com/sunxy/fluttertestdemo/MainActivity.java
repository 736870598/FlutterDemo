package com.sunxy.fluttertestdemo;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

import java.util.Random;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "com.example.flutterapp/plugin";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Log.v("sunxy--", "MainActivity onCreate");

        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                Log.v("sunxy", "methodCall: " + methodCall);
                if(methodCall.method.equals("dataInteraction")) {
                    int data = getData();
                    result.success(data);
                }else if(methodCall.method.equals("startNewView")){
                    startActivity(new Intent(MainActivity.this, SecondActivity.class));
                }else{
                    result.notImplemented();
                }
            }
        });

        GeneratedPluginRegistrant.registerWith(this);
    }

    private int getData() {
        Random ran = new Random();
        return ran.nextInt(100);
    }
}
