package com.rainbowforest.Application.service.user;

import java.util.List;

import com.rainbowforest.Application.model.constructionSite.ConstructionSite;
import com.rainbowforest.Application.model.user.UserRole;
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

import javax.persistence.EntityManager;

@Service
@Transactional

public class UserServiceImpl implements UserService {

	@Autowired
	private UserAccountRepository userRepository;

	@Autowired
	private UserAccountDetailsRepository userDetailsRepository;

	@Autowired
	private ConstructionSiteService constructionSiteService;

	@Autowired
	private EntityManager entityManager;


	private UserRole userRole;

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
		System.out.println("📝 Starting addUserDetails...");
		System.out.println("📝 UserDetails: " + (userDetails != null ? "Present" : "NULL"));
		System.out.println("📝 UserAccount: " + (userDetails != null && userDetails.getUserAccount() != null ? "Present" : "NULL"));

		try {
			// 1. Handle UserAccount
			if (userDetails.getUserAccount() != null) {
				UserAccount account = userDetails.getUserAccount();
				System.out.println("📝 Username: " + account.getUserName());

				// Encode password
				if (account.getUserPassword() != null && !account.getUserPassword().isEmpty()) {
					System.out.println("📝 Encoding password...");
					account.setUserPassword(
							new BCryptPasswordEncoder().encode(account.getUserPassword())
					);
				}

				// Handle UserRole
				if (account.getRole() != null && account.getRole().getId() != null) {
					System.out.println("📝 Role ID: " + account.getRole().getId());
					// Role should already be set with just the ID, JPA will handle it
					// No need to fetch if cascade is working
				}

				// Set enabled default
				if (account.getUserEnabled() == null) {
					System.out.println("📝 Setting userEnabled to 1");
					account.setUserEnabled(1);
				}
			}

			// 2. Handle ConstructionSite (if present)
			if (userDetails.getConstructionSites() != null) {
				Integer csId = userDetails.getConstructionSites().getId();
				System.out.println("📝 ConstructionSite ID: " + csId);

				if (csId != null && csId > 0) {
					if (constructionSiteService != null) {
						ConstructionSite managedSite = constructionSiteService.findById(csId);
						userDetails.setConstructionSites(managedSite);
					} else {
						System.err.println("⚠️ constructionSiteService is NULL!");
					}
				}
			}

			// 3. Save UserAccountDetails (cascade will save UserAccount)
			System.out.println("📝 Saving to database...");
			UserAccountDetails saved = userDetailsRepository.save(userDetails);
			System.out.println("✅ User saved successfully! ID: " + saved.getId());

		} catch (Exception e) {
			System.err.println("❌ Error saving user: " + e.getMessage());
			e.printStackTrace();
			throw new RuntimeException("Failed to save user: " + e.getMessage(), e);
		}
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
