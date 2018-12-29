package com.sunxy.fluttertestdemo;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;

/**
 * SunXiaoYu on 2018/12/29.
 * mail: sunxiaoyu@hexinpass.com
 */
public class SecondActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        TextView textView = new TextView(this);
        textView.setText("SecondActivitySecondActivity");
        setContentView(textView);
    }
}
