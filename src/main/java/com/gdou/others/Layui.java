package com.gdou.others;

import java.util.HashMap;
import java.util.List;

public class Layui  extends HashMap<String, Object> {

    public static Layui data(long count, List<?> data){
        Layui lay = new Layui();
        lay.put("code", 0);
        lay.put("msg", "");
        lay.put("count", count);
        lay.put("data", data);
        return lay;
    }
}
