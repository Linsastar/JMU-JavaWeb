package com.vo;

public class Classes {
    private int classId;
    private String className;

    public Classes() {
        // 无参数构造函数
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    @Override
    public String toString() {
        return "Classes{" +
                "classId=" + classId +
                ", className='" + className + '\'' +
                '}';
    }
}
