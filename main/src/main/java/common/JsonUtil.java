package common;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Component;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


public class JsonUtil {
    private static ObjectMapper objectMapper=new ObjectMapper();
// 把对象转成 json jackson支持list
  public static String object2String(Object object){
      if(object==null)
          return "";
      String s="";
      try {
          s= objectMapper.writeValueAsString(object);
      } catch (JsonProcessingException e) {
          e.printStackTrace();
      }
      return s;
  }
  //json转换自定义类
  public static <T> T string2Object(String s,Class <T> objClass){
      T  object=null;
      try {
          object= objectMapper.readValue(s,objClass);
      } catch (IOException e) {
          e.printStackTrace();
      }
    return object;
  }
  //json转换成自定义类的集合
  public static <T> List<T> string2List(String s,Class <T> objClass){
      JavaType javaType = objectMapper.getTypeFactory().constructParametricType(ArrayList.class, objClass);
       List<T> ts=new ArrayList<>();
      try {
          ts = objectMapper.readValue(s, javaType);
      } catch (IOException e) {
          e.printStackTrace();
      }
      return ts;

  }


}
