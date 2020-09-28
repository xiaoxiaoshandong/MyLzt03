package com.lzt.service;

import com.lzt.entity.Columns;
import com.lzt.entity.ParamVO;

import java.util.List;

public interface ColumnsService {
    List<Columns> getColumns(ParamVO param);
}
