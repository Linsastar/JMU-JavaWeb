package com.dao;

import com.vo.Students;
import java.util.List;

public interface IStudentsDAO {
    public boolean insertStudents(Students students) throws Exception;
    public boolean deleteStudents(String studentId) throws Exception;
    public boolean updateStudents(String studentId, String studentName, String studentPwd, String sex, int classId) throws Exception;
    public List<Students> findAllStudents() throws Exception;
    public Students findStudentsById(String studentId) throws Exception;
    public boolean verifyStudentLogin(String studentId,String studentPwd)throws Exception;
}

