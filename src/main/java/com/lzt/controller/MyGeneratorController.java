package com.lzt.controller;


import com.lzt.entity.MyGenerator;
import com.lzt.entity.ParamVO;
import com.lzt.service.MyGeneratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
@RequestMapping("/myGenerator")
public class MyGeneratorController {

    @Autowired(required = false)
    private MyGeneratorService myGeneratorService;

//    @Autowired(required = false)
//    public ColumnsProperties columnsProperties;

//   public static void main(String args[]){
//       List<Columns> columns = getColumns();
//       for (Columns c:columns ) {
//           System.out.println(c);
//       }
//
//   }

    @RequestMapping(value = "/getColumns")
    public List<MyGenerator> getMyGenerator(ParamVO param) {
        Integer  i = myGeneratorService.getMyGenerator(param);
        return null;
    }
}