package com.lzt.controller;


import com.lzt.entity.Columns;
import com.lzt.entity.ParamVO;
import com.lzt.myutils.IoUtil;
import com.lzt.myutils.PropertiesUtil;
import com.lzt.service.ColumnsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
@RequestMapping("/Columns")
public class ColumnsController {

    @Autowired(required = false)
    private ColumnsService columnsService;

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
    public List<Columns> getColumns(ParamVO param) {
        List<Columns> list = columnsService.getColumns(param);
        return null;
    }
}