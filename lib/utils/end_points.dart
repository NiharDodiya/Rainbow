class EndPoints {
  ///---------------------------------------------- Api Key ----------------------------------------------
  static const apiKey = 'c6d805c8b0751dab4dfda08908b90ee0';

  ///---------------------------------------------- Base url ----------------------------------------------
  static const baseUrl = 'https://rainbow-api-staging.herokuapp.com';


  ///---------------------------------------------- Keys ----------------------------------------------
  static const login = "${baseUrl}/api/user/login";
  static const register = "${baseUrl}/api/user/register";
  static const verificationSocial = "${baseUrl}/api/user/social/login";
  static const companyRegister = "${baseUrl}/api/company/register";
  static const idVerification = "${baseUrl}/api/user/idverification";
  static const selfieVerification = "${baseUrl}/api/user/selfiverification";
  static const verifyCode = "${baseUrl}/api/user/verifycode";
  static const advirtisersRegister = "${baseUrl}/api/advirtisers/register";
  static const createPassword = "${baseUrl}/api/user/createpassword";
  static const mobileCheck = "${baseUrl}/api/user/mobilecheck";
  static const countryList = "${baseUrl}/api/admin/country/list";
  static const nationalitiesList = "${baseUrl}/api/admin/nationalities/list";
  static const uploadImage = "${baseUrl}/api/upload/image";
  static const editProfile = "${baseUrl}/api/user/profile/update";
  static const viewProfile = "${baseUrl}/api/user/profile/view";
  static const privacy = "${baseUrl}/api/user/privacy";
  static const block = "${baseUrl}/api/user/block";
  static const unBlock = "${baseUrl}/api/user/unblock";
  static const blockList = "${baseUrl}/api/user/block/list";
  static const lat = "lat=";
  static const lon = "lon=";
  static const appId = "appid=";

}
