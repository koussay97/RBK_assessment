

abstract class CustomValidator {
  static final RegExp nameRegExp = RegExp(r"^[a-zA-Z]+$");
  static final RegExp numberRegExp =
      RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]');
  static final RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static final RegExp otpRegExp = RegExp(r"^[0-9]+$");

  static ValidationDto isNameValid(String? input) {
    ValidationDto assessment = ValidationDto(status: false, errorMessage: '');
    if (input == null) {
      assessment.errorMessage = 'can not accept with empty fields';
      assessment.status = false;
      return assessment;
    }

    if (nameRegExp.hasMatch(input) &&
        input.length < 30 &&
        input.length > 1 &&
        input.isNotEmpty) {
      assessment.status = true;
    } else {
      assessment.status = false;
      if (input.length > 30) {
        assessment.errorMessage = "name is too long";
      } else if (!nameRegExp.hasMatch(input) && input.isNotEmpty) {
        assessment.errorMessage = "a valid name must only contain a-z or A-Z";
      } else if (input.length == 1) {
        assessment.errorMessage = "name is too short";
      } else {
        assessment.errorMessage = "can not login with empty fields";
      }
    }
    return assessment;
  }

  static ValidationDto isOtpValid(String? otp) {
    ValidationDto assessment = ValidationDto(status: false, errorMessage: '');
    if (otp == null) {
      assessment.errorMessage = 'can not accept with empty fields';
      assessment.status = false;
      return assessment;
    }
    if (otpRegExp.hasMatch(otp) && otp.length == 6) {
      print('otp correct');
      assessment.status = true;
    } else {
      assessment.status = false;
      if (otp.length > 6) {
        print('otp >6');
        assessment.errorMessage =
            "otp is too long, length accepted  is 6 digits";
      } else if (!otpRegExp.hasMatch(otp) && otp.isNotEmpty) {
        print('otp not valid format');
        assessment.errorMessage = "a valid otp must only contain 0-9 $otp";
      } else if (otp.length < 6) {
        print('otp <6');
        assessment.errorMessage =
            "otp is too short, length accepted  is 6 digits";
      } else {
        print('otp is empty');
        assessment.errorMessage = "can not accept empty fields";
      }
    }
    return assessment;
  }

  static ValidationDto isNumberValid(String? number) {
    ValidationDto assessment = ValidationDto(status: false, errorMessage: '');

    if (number == null) {
      assessment.errorMessage = 'can not accept with empty fields';
      assessment.status = false;
      return assessment;
    }
    if (numberRegExp.hasMatch(number) &&
        number.length < 15 &&
        number.length >= 12 &&
        number.isNotEmpty) {
      assessment.status = true;
    } else {
      assessment.status = false;
      if (number.length > 15) {
        assessment.errorMessage = "number $number is too long,";
      } else if (!numberRegExp.hasMatch(number) && number.isNotEmpty) {
        assessment.errorMessage = "a valid number must only contain digits";
      } else if (number.length < 12 && number.isNotEmpty) {
        assessment.errorMessage = "number $number is too short,";
      } else {
        assessment.errorMessage = "can not accept with empty fields";
      }
    }
    return assessment;
  }

  static ValidationDto isEmailValid(String? email) {
    ValidationDto assessment = ValidationDto(status: false, errorMessage: '');

    if (email == null) {
      assessment.errorMessage = 'can not submit empty fields';
      assessment.status = false;
      return assessment;
    }
    if (emailRegExp.hasMatch(email) &&
        email.length < 30 &&
        email.length > 1 &&
        email.isNotEmpty) {
      assessment.status = true;
    } else {
      assessment.status = false;
      if (!emailRegExp.hasMatch(email) && email.isNotEmpty) {
        assessment.errorMessage =
            "a valid email must be of form example@mail.domain ";
      } else {
        assessment.errorMessage = "email not valid";
      }
    }
    return assessment;
  }

  static ValidationDto isFileSizeValid(int fileSize) {
    ValidationDto assessment = ValidationDto(status: false, errorMessage: '');
    if (fileSize <= 5000000) {
      assessment.status = true;
    } else {
      assessment.status = false;
      assessment.errorMessage =
          'file is too large, the file must not exceed 5 Mb';
    }
    return assessment;
  }
}

class ValidationDto {
  bool status;
  String? errorMessage;

  ValidationDto({required this.status, this.errorMessage});
}
