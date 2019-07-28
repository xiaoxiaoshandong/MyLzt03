package com.lzt.service;

import java.util.List;

import com.lzt.entity.NotePad;

public interface NotePadService {

	Integer addNotePad(NotePad notePad);

	List<NotePad> notePadSel();

}
