package com.jiyun.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiyun.bean.Course;
import com.jiyun.bean.Type;
import com.jiyun.mapper.CourseMapper;

@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseMapper courseMapper;

	@Override
	public List<Course> findAll(Course course) {
		List<Course> list = courseMapper.findAll(course);
		return list;
	}

	@Override
	public List<Type> findType() {
			List<Type> list = courseMapper.findType();
			return list;
	}

	@Override
	public void add(Course course) {
		courseMapper.add(course);
	}

	@Override
	public void deleteById(Integer cid) {
		courseMapper.deleteById(cid);
	}

	@Override
	public Course findById(Integer cid) {
		Course course = courseMapper.findById(cid);
		return course;
	}

	@Override
	public void update(Course course) {
		courseMapper.update(course);
	}

	@Override
	public Course checkName(String cname) {
		Course course = courseMapper.checkName(cname);
		return course;
	}
}
