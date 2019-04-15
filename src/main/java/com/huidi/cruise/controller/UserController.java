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
import com.huidi.cruise.utils.ResultVOUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Objects;

@RestController
@RequestMapping("/user")
@Api(value="UserController",description ="the api of users" )
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping("/login")
    @ApiOperation(value="user login",notes = " user login, add username to cookie",httpMethod = "POST",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
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
        return ResultVOUtil.success(username);
    }

    @GetMapping("/logout")
    @ApiOperation(value="user logout",notes = " user logout, delete username from cookie",httpMethod = "GET",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", dataType="String", name = "username", value = "username of user", required = true),
    })
    public ResultVO logout(@RequestParam("username") String username, HttpServletRequest request, HttpServletResponse response) {
        //get cookie
        if (Objects.isNull(username))
            throw new CommonException(CommonEnums.OBJECT_NULL);
        Cookie cookie = CookieUtil.get(request, CookieConstant.TOKEN);
        if (Objects.isNull(cookie)) {
            throw new CommonException(CommonEnums.OBJECT_NULL);
        }
       // if (username.equals(cookie.getValue())) ResultVOUtil.error(12, "");
        CookieUtil.set(response, CookieConstant.TOKEN, username, 0);
        return ResultVOUtil.success();
    }
}
