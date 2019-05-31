package common;

import lombok.ToString;

//定义一个带信息的json数据
@ToString
public class JsonData {
    private String  msg;
    private boolean result;
    private Object data;
    public static JsonData success(){
        JsonData jsonData=new JsonData();
        jsonData.setResult(true);
        return jsonData;
    }
    public static JsonData success(String msg){
        JsonData jsonData=new JsonData();
        jsonData.setResult(true);
        jsonData.setMsg(msg);
        return jsonData;
    }
    public static JsonData success(String msg, Object data){
        JsonData jsonData=new JsonData();
        jsonData.setResult(true);
        jsonData.setMsg(msg);
        jsonData.setData(data);
        return jsonData;
    }
    public static JsonData fail(){
        JsonData jsonData=new JsonData();
        jsonData.setResult(false);
        return jsonData;
    }
    public static JsonData fail(String msg){
        JsonData jsonData=new JsonData();
        jsonData.setMsg(msg);
        jsonData.setResult(false);
        return jsonData;
    }


    public boolean isResult() {
        return result;
    }

    public void setResult(boolean result) {
        this.result = result;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
