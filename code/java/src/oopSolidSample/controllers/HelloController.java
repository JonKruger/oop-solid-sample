package oopSolidSample.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.ColumnMapRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.RowMapperResultSetExtractor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/hello.spr")
public class HelloController {

	@Autowired
	private JdbcTemplate sql;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		ModelAndView mav = new ModelAndView("hello");
		mav.addObject("helloMsg", "Hello There");
		RowMapper rowMapper = new ColumnMapRowMapper();
		try {
			sql.execute("create table paul ( username varchar(25) )");
		}
		catch (Exception e) {
			//do nothing
		}
		List allUsers = (List) sql.query("select * from paul",
				new RowMapperResultSetExtractor(rowMapper, 10));
		try {
			sql.execute("drop table paul");
		}
		catch (Exception e) {
			//do nothing
		}
		return mav;
	}
}
