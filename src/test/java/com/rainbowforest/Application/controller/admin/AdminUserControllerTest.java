package com.rainbowforest.Application.controller.admin;

import com.rainbowforest.Application.controller.AdminUserController;
import com.rainbowforest.Application.model.user.UserAccountDetails;
import com.rainbowforest.Application.service.constructionsite.ConstructionSiteService;
import com.rainbowforest.Application.service.user.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.MessageSource;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;

import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(AdminUserController.class)
class AdminUserControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private UserService userService;

    @MockBean
    private ConstructionSiteService constructionSiteService;

    @MockBean
    private MessageSource messageSource;

    @Test
    void shouldReturnUserForm() throws Exception {
        when(constructionSiteService.findAllConstructionSite())
                .thenReturn(List.of());

        mockMvc.perform(get("/admin/user-form"))
                .andExpect(status().isOk())
                .andExpect(view().name("admin/user/userform"))
                .andExpect(model().attributeExists("user"));
    }

    @Test
    void shouldReturnUsersList() throws Exception {
        when(userService.findAllUsers()).thenReturn(List.of());

        mockMvc.perform(get("/admin/users"))
                .andExpect(status().isOk())
                .andExpect(view().name("admin/user/users"))
                .andExpect(model().attributeExists("users"));
    }

    @Test
    void shouldDeleteUser() throws Exception {
        mockMvc.perform(post("/admin/users/delete-user")
                        .param("usid", "1"))
                .andExpect(status().is3xxRedirection());

        verify(userService).deleteUser(1);
    }

    @Test
    void shouldEditUser() throws Exception {
        when(userService.findOneById(1)).thenReturn(new UserAccountDetails());
        when(constructionSiteService.findAllConstructionSite()).thenReturn(List.of());

        mockMvc.perform(post("/admin/users/edit-user")
                        .param("usid", "1"))
                .andExpect(status().isOk())
                .andExpect(view().name("admin/user/edituser"))
                .andExpect(model().attributeExists("user"));
    }
}
