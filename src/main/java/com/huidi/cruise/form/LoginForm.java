package com.huidi.cruise.form;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel(value = "model of login user")
public class LoginForm {
    @ApiModelProperty(value="username",example = "wanghuidi")
    private String username;
    @ApiModelProperty(value="password",example = "2635700w")
    private String password;
}
