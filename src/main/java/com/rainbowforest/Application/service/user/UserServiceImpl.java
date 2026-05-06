package com.rainbowforest.Application.service.user;

import java.util.List;

import com.rainbowforest.Application.model.constructionSite.ConstructionSite;
import com.rainbowforest.Application.service.constructionsite.ConstructionSiteService;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rainbowforest.Application.model.user.UserAccount;
import com.rainbowforest.Application.model.user.UserAccountDetails;
import com.rainbowforest.Application.repository.UserAccountDetailsRepository;
import com.rainbowforest.Application.repository.UserAccountRepository;

@Service
@Transactional

public class UserServiceImpl implements UserService {

	@Autowired
	private UserAccountRepository userRepository;

	@Autowired
	private UserAccountDetailsRepository userDetailsRepository;

	@Autowired
	private ConstructionSiteService constructionSiteService;

	@Override
	public List<UserAccountDetails> findAllUsers() {
		List<UserAccountDetails> userList = userDetailsRepository.findAll();
		return userList;
	}

	@Override
	public void addUser(UserAccount user) {
		user.setUserPassword(new BCryptPasswordEncoder().encode(user.getUserPassword()));
		userRepository.save(user);
	}

	@Override
	public void deleteUser(int userId) {
		userDetailsRepository.deleteById(userId);
	}

	@Override
	public UserAccountDetails findOneById(int id) {
		UserAccountDetails user = userDetailsRepository.getOne(id);
		return user;
	}

	@Override
	public void addUserDetails(UserAccountDetails userDetails) {
		// Handle password encoding
		if (userDetails.getUserAccount() != null && userDetails.getUserAccount().getUserPassword() != null) {
			userDetails.getUserAccount().setUserPassword(
					new BCryptPasswordEncoder().encode(userDetails.getUserAccount().getUserPassword())
			);
		}

		// Handle detached ConstructionSite entity
		if (userDetails.getConstructionSites() != null && userDetails.getConstructionSites().getId() > 0) {
			ConstructionSite managedSite = constructionSiteService.findById(userDetails.getConstructionSites().getId());
			userDetails.setConstructionSites(managedSite);
		}

		userDetailsRepository.save(userDetails);
	}


	@Override
	public void updateUserDetails(
			String newFirstName, 
			String newLastName, 
			String newEmail, 
			String newPhoneNumber,
			String newPosition, 
			Integer newConstructionSitesId, 
			Integer id) {
		userDetailsRepository.updateUserDetails(
			newFirstName, 
			newLastName, 
			newEmail, 
			newPhoneNumber, 
			newPosition,
			newConstructionSitesId, 
			id);
	}

	@Override
	public UserAccount findOneByUserName(String userName) {
		UserAccount user = userRepository.findOneByUserName(userName);
		return user;
	}

	@Override
	public void securityUpdate(String newUserPassword, Integer newUserEnabled, Integer newRoleId, Integer id) {
		userRepository.securityUpdate(newUserPassword, newUserEnabled, newRoleId, id);
	}

	@Override
	public User getCurrentUser() {
		return null;
	}

	@Override
	public List<UserAccount> findAllAccount() {
		List<UserAccount> users = userRepository.findAll();
		return users;
	}

	@Override
	public UserAccount findOneAccountById(int id) {
		UserAccount user = userRepository.getOne(id);
		return user;
	}

	@Override
	public UserAccountDetails getLoggedUser(String userName) {
		UserAccountDetails user = userDetailsRepository.getLoggedUser(userName);
		return user;
	}

	@Override
	public void updatePassword(String newPassword, int id) {
		userDetailsRepository.updatePassword(newPassword, id);
	}
}
