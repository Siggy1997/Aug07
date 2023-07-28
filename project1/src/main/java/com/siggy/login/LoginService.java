package com.siggy.login;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
	@Autowired
	LoginDAO loginDAO = new LoginDAO();
	
	
	public LoginDTO login(LoginDTO dto) {
		return loginDAO.login(dto);
	}


	public int join(JoinDTO joinDTO) {
		return loginDAO.join(joinDTO);
	}


	public List<JoinDTO> members() {
		return loginDAO.members();
	}
	 
}
