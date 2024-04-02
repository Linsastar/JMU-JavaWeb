package com.dao.impl;

import com.dao.IClassesDAO;
import com.db.ConnectionManager;
import com.vo.Classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClassesDAOImpl implements IClassesDAO {
    @Override
    public List<Classes> findClassesID() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Classes> classesList = new ArrayList<>();
        try {
            con = ConnectionManager.getConnection(); // 获取数据库连接
            String strSql = "SELECT classId, className FROM classes";
            pstmt = con.prepareStatement(strSql); // 创建预处理语句
            rs = pstmt.executeQuery(); // 执行查询语句
            while (rs.next()) {
                int classId = rs.getInt("classId");
                String className = rs.getString("className");
                Classes classes = new Classes();
                classes.setClassId(classId);
                classes.setClassName(className);
                classesList.add(classes);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // 处理异常
        } finally {
            // 关闭资源
            ConnectionManager.closeResultSet(rs);
            ConnectionManager.closeStatement(pstmt);
            ConnectionManager.closeConnection(con);
        }
        return classesList;
    }
}


