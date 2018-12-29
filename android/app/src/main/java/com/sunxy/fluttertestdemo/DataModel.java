package com.sunxy.fluttertestdemo;

import android.os.Parcel;
import android.os.Parcelable;

/**
 * SunXiaoYu on 2018/12/29.
 * mail: sunxiaoyu@hexinpass.com
 */
public class DataModel implements Parcelable {
    private String value;

    public DataModel(){}
    protected DataModel(Parcel in) {
        value = in.readString();
    }

    public static final Creator<DataModel> CREATOR = new Creator<DataModel>() {
        @Override
        public DataModel createFromParcel(Parcel in) {
            return new DataModel(in);
        }

        @Override
        public DataModel[] newArray(int size) {
            return new DataModel[size];
        }
    };

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(value);
    }
}
