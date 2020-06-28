package com.jiyun.service;

import java.util.List;

import com.jiyun.bean.Course;
import com.jiyun.bean.Type;

public interface CourseService {

	List<Course> findAll(Course course);

	List<Type> findType();

	void add(Course course);

	void deleteById(Integer cid);

	Course findById(Integer cid);

	void update(Course course);

	Course checkName(String cname);

}
