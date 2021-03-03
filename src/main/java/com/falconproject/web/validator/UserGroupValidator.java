package com.falconproject.web.validator;

import com.falconproject.web.models.UserGroup;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class UserGroupValidator implements Validator {
    @Override
    public boolean supports(Class<?> aClass) {
        return UserGroup.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "groupName", "NotEmpty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "groupDescription", "NotEmpty");
    }
}
