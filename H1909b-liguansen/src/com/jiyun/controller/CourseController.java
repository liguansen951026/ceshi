package com.jiyun.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiyun.bean.Course;
import com.jiyun.bean.Type;
import com.jiyun.service.CourseService;

@Controller
@RequestMapping("course")
public class CourseController {

	@Autowired
	private CourseService courseService;
	
	@ModelAttribute
	public void findType(Model model){
		List<Type> tlist = courseService.findType();
		model.addAttribute("tlist", tlist);
	}
	@RequestMapping("findAll")
	public String findAll(Model model,@RequestParam(defaultValue="1")Integer pageNum,Course course){
		PageHelper.startPage(pageNum, 2);
		List<Course> clist = courseService.findAll(course);
		PageInfo<Course> page = new PageInfo<>(clist);
		model.addAttribute("page", page);
		return "show";
	}
	@RequestMapping("toadd")
	public String toadd(){
		return "add";
	}
	@RequestMapping("add")
	public String add(MultipartFile picFile,Course course) throws Exception{
		String filename = picFile.getOriginalFilename();
		String suffix = filename.substring(filename.lastIndexOf("."));
		String newFileName = System.currentTimeMillis()+suffix;
		File file = new File("E:/photo/"+newFileName);
		picFile.transferTo(file);
		course.setImg(newFileName);
		courseService.add(course);
		return "redirect:findAll.do";
	}
	@RequestMapping("deleteById")
	public String deleteById(Integer cid){
		courseService.deleteById(cid);
		return "redirect:findAll.do";
	}
	@RequestMapping("findById")
	public String findById(Integer cid,Model model){
		Course course = courseService.findById(cid);
		model.addAttribute("course", course);
		return "update";
	}
	@RequestMapping("update")
	public String update(MultipartFile picFile,Course course) throws Exception{
		if (picFile.getSize()>0) {
			String filename = picFile.getOriginalFilename();
			String suffix = filename.substring(filename.lastIndexOf("."));
			String newFileName = System.currentTimeMillis()+suffix;
			File file = new File("E:/photo/"+newFileName);
			picFile.transferTo(file);
			course.setImg(newFileName);
		}
		courseService.update(course);
		return "redirect:findAll.do";
	}
	@RequestMapping("checkName")
	public void checkName(HttpServletResponse response,String cname) throws Exception{
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain;charset=utf-8");
		Course course = courseService.checkName(cname);
		if (course!=null) {
			response.getWriter().write("用户名不可重复");
		} else {
			response.getWriter().write("用户名可用");
		}
	}
}
