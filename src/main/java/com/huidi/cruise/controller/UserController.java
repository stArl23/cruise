package com.huidi.cruise.controller;

import com.huidi.cruise.VO.ResultVO;
import com.huidi.cruise.constant.CookieConstant;
import com.huidi.cruise.enums.CommonEnums;
import com.huidi.cruise.enums.UserEnums;
import com.huidi.cruise.exception.CommonException;
import com.huidi.cruise.exception.UserException;
import com.huidi.cruise.form.LoginForm;
import com.huidi.cruise.service.UserService;
import com.huidi.cruise.utils.CookieUtil;
import com.huidi.cruise.utils.ResultVOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Objects;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public ResultVO<String> login(@Valid LoginForm loginForm, BindingResult bindingResult, HttpServletResponse response) {
        if (bindingResult.hasErrors()) {
            throw new CommonException(CommonEnums.PARAM_INVALID.getId()
                    , bindingResult.getFieldError().getDefaultMessage());
        }

        String username = userService.login(loginForm.getUsername(), loginForm.getPassword());
        //login error
        if (Objects.isNull(username)) {//throw exception;
            throw new UserException(UserEnums.USER_NO_FOUND.getId()
                    , UserEnums.USER_NO_FOUND.getMessage());
        }

        // set cookie in front end
       // CookieUtil.set(response, CookieConstant.TOKEN, username, CookieConstant.EXPIRE);
        return ResultVOUtils.success(username);
    }

    @GetMapping("/logout")
    public ResultVO logout(@RequestParam("username") String username, HttpServletRequest request, HttpServletResponse response) {
        //get cookie
        if (Objects.isNull(username))
            throw new CommonException(CommonEnums.OBJECT_NULL);
        Cookie cookie = CookieUtil.get(request, CookieConstant.TOKEN);
        if (Objects.isNull(cookie)) {
            throw new CommonException(CommonEnums.OBJECT_NULL);
        }
        // if (username.equals(cookie.getValue())) ResultVOUtils.error(12, "");
        CookieUtil.set(response, CookieConstant.TOKEN, username, 0);
        return ResultVOUtils.success();
    }
}
