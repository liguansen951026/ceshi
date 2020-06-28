package com.jiyun.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jiyun.bean.Course;
import com.jiyun.bean.Type;

public interface CourseMapper {

	List<Course> findAll(Course course);

	List<Type> findType();

	void add(Course course);

	void deleteById(Integer cid);

	Course findById(Integer cid);

	void update(Course course);

	Course checkName(@Param("cname")String cname);

}
