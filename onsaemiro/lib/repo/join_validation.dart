import 'package:onsaemiro/classes/toast_message.dart';

class PossibleEmailText {
  bool isEmail;
  PossibleEmailText({
    this.isEmail = false,
  });
}

PossibleEmailText checkEmailText(String value) {
  var checkEmailText = PossibleEmailText();
  final validEmail = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  if (validEmail.hasMatch(value)) {
    checkEmailText.isEmail = true;
  } else {
    checkEmailText.isEmail = false;
  }
  return checkEmailText;
}

vaildationemail(String value) {
  var vaildationemail = checkEmailText(value);

  if (value.isEmpty) {
    return toastMessage("이메일을 작성해주세요");
  } else {
    if (vaildationemail.isEmail == false) {
      return toastMessage("잘못된 이메일 형식입니다.");
    } else {
      return null;
    }
  }
}

class PossibleNickNameText {
  bool isCharacters;
  bool is1Symbol;
  bool is1Number;
  PossibleNickNameText(
      {this.isCharacters = false,
      this.is1Symbol = false,
      this.is1Number = false});
}

PossibleNickNameText checkNickNameText(String value) {
  var possibleNickNameText = PossibleNickNameText();
  final validNumbers = RegExp(r'(\d+)');
  final validSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  if (value.length >= 2 && value.length <= 8) {
    possibleNickNameText.isCharacters = true;
  } else {
    possibleNickNameText.isCharacters = false;
  }

  if (!validSpecial.hasMatch(value)) {
    possibleNickNameText.is1Symbol = true;
  } else {
    possibleNickNameText.is1Symbol = false;
  }

  if (!validNumbers.hasMatch(value)) {
    possibleNickNameText.is1Number = true;
  } else {
    possibleNickNameText.is1Number = false;
  }
  return possibleNickNameText;
}

vaildationnickname(String value) {
  var vaildationnickname = checkNickNameText(value);

  if (value.isEmpty) {
    return toastMessage("닉네임을 작성해주세요");
  } else {
    if (vaildationnickname.isCharacters == false) {
      return toastMessage("닉네임은 2~8자 사이로 입력해주세요.");
    } else if (vaildationnickname.is1Number == false ||
        vaildationnickname.is1Symbol == false) {
      return toastMessage("숫자, 특수문자를 포함할 수 없습니다.");
    } else {
      return null;
    }
  }
}

class PossiblePasswordText {
  bool is8Characters;
  bool is1Symbol;
  bool is1Letter;
  bool is1Number;
  PossiblePasswordText(
      {this.is8Characters = false,
      this.is1Symbol = false,
      this.is1Letter = false,
      this.is1Number = false});
}

PossiblePasswordText checkPasswordText(String value) {
  var possiblePasswordText = PossiblePasswordText();
  final validNumbers = RegExp(r'(\d+)');
  final validAlphabet = RegExp(r'[a-zA-Z]');
  final validSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  if (value.length >= 8 && value.length <= 12) {
    possiblePasswordText.is8Characters = true;
  } else {
    possiblePasswordText.is8Characters = false;
  }

  if (validSpecial.hasMatch(value)) {
    possiblePasswordText.is1Symbol = true;
  } else {
    possiblePasswordText.is1Symbol = false;
  }

  if (validAlphabet.hasMatch(value)) {
    possiblePasswordText.is1Letter = true;
  } else {
    possiblePasswordText.is1Letter = false;
  }

  if (validNumbers.hasMatch(value)) {
    possiblePasswordText.is1Number = true;
  } else {
    possiblePasswordText.is1Number = false;
  }
  return possiblePasswordText;
}

vaildationpassword(String value) {
  var vaildationpassword = checkPasswordText(value);

  if (value.isEmpty) {
    return toastMessage("비밀번호를 작성해주세요");
  } else {
    if (vaildationpassword.is8Characters == false) {
      return toastMessage("8~12자 비밀번호를 설정해주세요.");
    } else if (vaildationpassword.is1Number == false ||
        vaildationpassword.is1Letter == false ||
        vaildationpassword.is1Symbol == false) {
      return toastMessage("비밀번호에 숫자, 문자, 특수문자는 필수입니다.");
    } else {
      return null;
    }
  }
}

class PossiblePhoneNumber {
  bool is11Characters;
  bool is1Symbol;
  PossiblePhoneNumber({this.is11Characters = false, this.is1Symbol = false});
}

PossiblePhoneNumber checkPhoneNumberText(String value) {
  var possiblePhoneNumber = PossiblePhoneNumber();
  final validSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  if (value.length == 11) {
    possiblePhoneNumber.is11Characters = true;
  } else {
    possiblePhoneNumber.is11Characters = false;
  }

  if (!validSpecial.hasMatch(value)) {
    possiblePhoneNumber.is1Symbol = true;
  } else {
    possiblePhoneNumber.is1Symbol = false;
  }

  return possiblePhoneNumber;
}

vaildationPhoneNumber(String value) {
  var vaildationPhoneNumber = checkPhoneNumberText(value);

  if (value.isEmpty) {
    return toastMessage("전화번호를 입력해주세요.");
  } else {
    if (vaildationPhoneNumber.is11Characters == false) {
      return toastMessage("전화번호를 11자리를 입력해주세요.");
    } else {
      if (vaildationPhoneNumber.is1Symbol == false) {
        return toastMessage("특수문자없이 숫자만 입력해주세요.");
      } else {
        return null;
      }
    }
  }
}

class PossibleNameText {
  bool isCharacters;
  bool is1Symbol;
  bool is1Letter;
  bool is1Number;
  PossibleNameText(
      {this.isCharacters = false,
      this.is1Symbol = false,
      this.is1Letter = false,
      this.is1Number = false});
}

PossibleNameText checkNameText(String value) {
  var possibleNameText = PossibleNameText();
  final validNumbers = RegExp(r'(\d+)');
  final validAlphabet = RegExp(r'[a-zA-Z]');
  final validSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  if (value.length >= 2 && value.length <= 5) {
    possibleNameText.isCharacters = true;
  } else {
    possibleNameText.isCharacters = false;
  }

  if (!validSpecial.hasMatch(value)) {
    possibleNameText.is1Symbol = true;
  } else {
    possibleNameText.is1Symbol = false;
  }

  if (!validAlphabet.hasMatch(value)) {
    possibleNameText.is1Letter = true;
  } else {
    possibleNameText.is1Letter = false;
  }

  if (!validNumbers.hasMatch(value)) {
    possibleNameText.is1Number = true;
  } else {
    possibleNameText.is1Number = false;
  }
  return possibleNameText;
}

vaildationname(String value) {
  var vaildationname = checkNameText(value);

  if (value.isEmpty) {
    return toastMessage("이름을 작성해주세요");
  } else {
    if (vaildationname.isCharacters == false) {
      return toastMessage("이름은 2~5자 사이로 입력해주세요.");
    } else if (vaildationname.is1Number == false ||
        vaildationname.is1Letter == false ||
        vaildationname.is1Symbol == false) {
      return toastMessage("실명을 입력해주세요.");
    } else {
      return null;
    }
  }
}

class Possibledob {
  bool is8Characters;
  bool is1Symbol;
  Possibledob({this.is8Characters = false, this.is1Symbol = false});
}

Possibledob checkdob(String value) {
  var possibledob = Possibledob();
  final validSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  if (value.length == 8) {
    possibledob.is8Characters = true;
  } else {
    possibledob.is8Characters = false;
  }

  if (!validSpecial.hasMatch(value)) {
    possibledob.is1Symbol = true;
  } else {
    possibledob.is1Symbol = false;
  }

  return possibledob;
}

vaildationdob(String value) {
  var vaildationdob = checkdob(value);

  if (value.isEmpty) {
    return toastMessage("생년월일을 입력해주세요.");
  } else {
    if (vaildationdob.is8Characters == false) {
      return toastMessage("생년월일은 8자리를 입력해주세요.");
    } else {
      if (vaildationdob.is1Symbol == false) {
        return toastMessage("특수문자없이 숫자만 입력해주세요.");
      } else {
        return null;
      }
    }
  }
}
