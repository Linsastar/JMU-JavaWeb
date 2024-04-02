package com.dao.impl;

import com.dao.IStudentsDAO;
import com.db.ConnectionManager;
import com.vo.Students;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentsDAOImpl implements IStudentsDAO {
    public boolean insertStudents(Students students) throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try{
            con = ConnectionManager.getConnection();  //1.创建连接
            String strSql = "insert into students values(?,?,?,?,?)";
            pstmt = con.prepareStatement(strSql);  //2.创建预处理语句总管
            pstmt.setString(1,students.getStudentId());
            pstmt.setString(2,students.getStudentName());
            pstmt.setString(3,students.getStudentPwd());
            pstmt.setString(4,students.getSex());
            pstmt.setInt(5,students.getClassId());
            if(pstmt.executeUpdate() > 0){ //3.语句总管执行SQL语句
                flag = true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            ConnectionManager.closeStatement(pstmt);
            ConnectionManager.closeConnection(con);
        }
        return flag;
    }

    @Override
    public boolean deleteStudents(String studentId) throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try{
            con = ConnectionManager.getConnection();  //1.创建连接
            String strSql = "delete from students where studentId=?";
            pstmt = con.prepareStatement(strSql);  //2.创建预处理语句总管
            pstmt.setString(1,studentId);
            if(pstmt.executeUpdate() > 0){ //3.语句总管执行SQL语句
                flag = true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            ConnectionManager.closeStatement(pstmt);
            ConnectionManager.closeConnection(con);
        }
        return flag;
    }

    @Override
    public boolean updateStudents(String studentId, String studentName, String studentPwd, String sex, int classId) throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try{
            con = ConnectionManager.getConnection();  //1.创建连接
            String strSql = "update students set studentName = ?, studentPwd = ?, sex = ?, classId = ? where studentId = ?";
            pstmt = con.prepareStatement(strSql);  //2.创建预处理语句总管
            pstmt.setString(1, studentName);
            pstmt.setString(2, studentPwd);
            pstmt.setString(3, sex);
            pstmt.setInt(4, classId);
            pstmt.setString(5, studentId);
            if(pstmt.executeUpdate() > 0){ //3.语句总管执行SQL语句
                flag = true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            ConnectionManager.closeStatement(pstmt);
            ConnectionManager.closeConnection(con);
        }
        return flag;
    }


    @Override
    public List<Students> findAllStudents() throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Students> all = new ArrayList<Students>();
        try{
            con = ConnectionManager.getConnection();  //1.创建连接
            String strSql = "select * from students";
            pstmt = con.prepareStatement(strSql);  //2.创建预处理语句总管
            rs = pstmt.executeQuery(); //3.语句总管执行SQL语句
            Students stu = null;
            while(rs.next()){ //4.处理结果集
                stu = new Students();
                stu.setStudentId(rs.getString("studentId"));
                stu.setStudentName(rs.getString("studentName"));
                stu.setStudentPwd(rs.getString(3));
                stu.setSex(rs.getString(4));
                stu.setClassId(rs.getInt("classId"));
                all.add(stu);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            ConnectionManager.closeStatement(pstmt);
            ConnectionManager.closeConnection(con);
        }
        return all;
    }

    @Override
    public Students findStudentsById(String studentId) throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Students stu = null;
        try{
            con = ConnectionManager.getConnection();  //1.创建连接
            String strSql = "select * from students where studentId=?";
            pstmt = con.prepareStatement(strSql);  //2.创建预处理语句总管
            pstmt.setString(1,studentId);
            rs = pstmt.executeQuery(); //3.语句总管执行SQL语句
            if(rs.next()){ //4.处理结果集
                stu = new Students();
                stu.setStudentId(rs.getString("studentId"));
                stu.setStudentName(rs.getString("studentName"));
                stu.setStudentPwd(rs.getString(3));
                stu.setSex(rs.getString(4));
                stu.setClassId(rs.getInt("classId"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            ConnectionManager.closeStatement(pstmt);
            ConnectionManager.closeConnection(con);
        }
        return stu;
    }

    @Override
    public boolean verifyStudentLogin(String studentId, String studentPwd) throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null; // 添加结果集对象
        boolean flag = false;
        try {
            con = ConnectionManager.getConnection();  //1.创建连接
            String strSql = "select * from students where studentId=? and studentPwd=?"; // 修改SQL语句
            pstmt = con.prepareStatement(strSql);  //2.创建预处理语句总管
            pstmt.setString(1, studentId);
            pstmt.setString(2, studentPwd); // 设置密码参数

            rs = pstmt.executeQuery(); // 执行查询
            flag = rs.next(); // 如果查询到结果，则返回true

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.closeResultSet(rs); // 关闭结果集对象
            ConnectionManager.closeStatement(pstmt);
            ConnectionManager.closeConnection(con);
        }
        return flag;
    }
}
