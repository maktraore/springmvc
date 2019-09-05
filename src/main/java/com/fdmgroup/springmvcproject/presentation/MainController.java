package com.fdmgroup.springmvcproject.presentation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fdmgroup.springmvcproject.data.UserDao;
import com.fdmgroup.springmvcproject.domain.User;

/**
 * This controls the jsp pages using action and HttpRequest post and get.
 * 
 * @author mamadou.traore
 *
 */
@Controller
public class MainController {

	@Autowired
	private User user;

	@Autowired
	private UserDao dao;

	@RequestMapping(value = { "/", "/home", "*/home" })
	public String goHome() {
		return "main";
	}

	@RequestMapping("toRegister")
	public String goRegister(Model model) {
		model.addAttribute("newRegister", user);
		return "register";
	}

	@RequestMapping("toLogin")
	public String goLogin(Model model) {
		model.addAttribute("newLogin", user);
		return "login";
	}

	@RequestMapping("toLogout")
	public String goLogout(Model model) {
		model.addAttribute("newLogin", user);
		return "login";
	}

	@RequestMapping("register")
	public String goProcessUser(Model model, User retrievedUser, @RequestParam String confirmPassword) {
		String trimmedFirstName = validate(retrievedUser.getFirstName());
		String trimmedLastName = validate(retrievedUser.getLastName());
		String trimmedUsername = validate(retrievedUser.getUsername());
		String trimmedPassword = validate(retrievedUser.getPassword());
		String trimmedEmailAddress = validate(retrievedUser.getEmailAddress());

		if (trimmedPassword.equals(confirmPassword)) {
			retrievedUser.setFirstName(trimmedFirstName);
			retrievedUser.setLastName(trimmedLastName);
			retrievedUser.setUsername(trimmedUsername);
			retrievedUser.setPassword(trimmedPassword);
			retrievedUser.setEmailAddress(trimmedEmailAddress);
			dao.register(retrievedUser);

			model.addAttribute("newLogin", user);
			model.addAttribute("confirmedUser", retrievedUser);
			return "login";
		} else {
			model.addAttribute("newRegister", user);
			return "register";
		}
	}

	@RequestMapping("userPage")
	public String processLogin(Model model, User user, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String trimmedUsername = validate(user.getUsername());
		String trimmedPassword = validate(user.getPassword());
		User retrievedUser = dao.read(trimmedUsername);
		if (retrievedUser != null && retrievedUser.getPassword().equals(trimmedPassword)) {
			session.setAttribute("retrievedUser", retrievedUser);
			return "userPage";
		} else {
			model.addAttribute("status", "invalid user/pass");
			model.addAttribute("newLogin", user);
			return "login";
		}
	}

	@RequestMapping("logout")
	public String processLogout(User user, HttpServletRequest request) {
		request.getSession().invalidate();
		return "main";
	}

	private String validate(String str) {

		if (str == null || str.trim().isEmpty()) {
			throw new IllegalArgumentException("Input cannot be null or empty");
		}
		return str.trim();
	}

	@RequestMapping("/404")
	public String goProcessError() {
		return "error404";
	}

	@ExceptionHandler(IllegalArgumentException.class)
	public String handleException(Model model, Exception e) {
		model.addAttribute("givenException", e);
		model.addAttribute("newRegister", user);
		return "register";
	}

}
