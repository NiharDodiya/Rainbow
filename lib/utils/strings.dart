import 'package:flutter/material.dart';
import 'package:rainbow/screens/Home/settings/payment/widget/remove_dialog.dart';
import 'package:rainbow/screens/Home/settings/subscription/subscription_payment/subscription_payment_screen.dart';

class Strings {
  ///---------------------------------------- Utils ----------------------------------------

  static const buildingFamilies = "Building families and bridging dreams";

  ///-----------------------------------------auth------------------------------------------------
  static const continueWithEmail = "Continue with Email";
  static const alreadyHaveAccount = "Already have an account? ";
  static const google = 'Google';
  static const facebook = 'FaceBook';
  static const signIn = 'Sign in';
  static const signUp = 'Sign up';
  static const houseNumber = 'House Number';
  static const houseNumberError = 'House Number required';
  static const streetName = 'Street Name';
  static const street = 'Street ';
  static const profession = 'Profession';
  static const professionError = 'Profession is Required';
  static const country = 'Country';
  static const doctor = 'Doctor';
  static const admin = 'Admin';
  static const endUsers = 'End Users';
  static const companyName = 'Company Name';
  static const companyNameError = 'Company Name is Required';
  static const myCompany = 'My Company';
  static const companyNumber = 'Company Number';
  static const companyNumberError = 'Company Number is Required';
  static const postalCode = 'Postal Code';
  static const postalCodeDigitHint = '123125';
  static const website = 'Website';
  static const websiteError = 'Website is Required';
  static const websiteHint = 'www.mymom.com';
  static const sign_Up = 'Signup';
  static const forAdvertise = " for advertiser's account";
  static const forEndUserAccount = " for End-User account";
  static const termsServices =
      'By continuing you agree Rainbow’s Terms of Services \n& Privacy Policy.';
  static const welcomeBack = 'Welcome Back!';
  static const googleSignInSuccess = 'google SignIn Success';
  static const faceBookSignInSuccess = 'faceBook SignIn Success';
  static const googleLogOutSuccess = 'google SignOut Success';
  static const userName = 'User name';
  static const forgotPassword = 'Forgot password?';
  static const login = 'Login';
  static const log_in = 'Log in';
  static const loginAsAdvertiser = ' as advertiser';
  static const loginAsEndUser = ' Log in as End-User';
  static const dontHaveAccount = ' Don’t have an account ';
  static const getStarted = 'Get Started';
  static const notVerified = 'Your Account \nis not yet verified';
  static const completeYourProfile =
      'Complete your profile to unlock \nmore rainbow feature';
  static const important = 'Important';
  static const smoothProcess =
      'To ensure a smooth process, please read the following reminders:';
  static const prepare = '-Prepare your valid ID';
  static const success = 'Success!';
  static const allow =
      'Please allow up to 1 business day for our team to review your ID submission';
  static const update =
      'We’ll update you on the status of your verification by email and on your account limits page';
  static const gotIt = "OK, GOT IT";
  static const cancel = "CANCEL";
  static const idVerification = "ID Verification";
  static const idType = "ID Type";
  static const idNo = "ID No.";
  static const uploadFrontPicture = "Upload front picture of ID";
  static const uploadBackPicture = "Upload back picture of ID";
  static const next = "Next";
  static const permanentResident = "Permanent Resident Card";
  static const verifyPhone = "Verify Phone";
  static const verifyAccount = "Verify Account";
  static const reciveCode = "Didn’t recive code?";
  static const resendOtp = "Resend OTP";
  static const newPassword = "New Password";
  static const newPasswordChange =
      "Your new password must be different\nfrom previous used password";
  static const confirmPassword = "confirm New Password";
  static const confirmShortPassword =
      "please enter 1 Capital Letters 1 Small Letters and Special character with 8 Character";
  static const coPasswordEmpty = "please enter  confirm Password";
  static const confirmPasswordMismatch = "confirm  Password is Mismatch";
  static const submit = "Submit";
  static const codeSent = "Code is sent to +1 234 567 8901";
  static const companyNumberDigit = "123 456 789 3123";

  ///---------------------------------------- Register ----------------------------------------
  static const register = 'Register';
  static const fullName = 'Full Name';
  static const email = 'Email';
  static const emailExample = 'example@email.com';
  static const password = 'Password';
  static const passwordExample = '• • • • • • • • •';
  static const reTypePassword = 'Re-Type Password';
  static const addressLine1 = 'Address Line 1';
  static const addressLine1Hint = '123 Street Name, City ,';
  static const addressLine2 = 'Address Line 2';
  static const addressLine2Hint = 'State, Country, Postal Code';
  static const phoneNumber = 'Phone Number';
  static const phoneNumberHint = '123 456 789';
  static const maritalStatus = 'Marital Status';
  static const ethnicity = 'Ethnicity';
  static const ethnicityHint = 'British';
  static const idNoT = '123456';
  static const birthDate = 'Birth Date';
  static const birthDateHint = 'MM/DD/YYYY';
  static const noOfKids = 'No of Kids';
  static const noOfKidsHint = '0';
  static const fullNameError = 'Full Name is required';
  static const emailError = 'Email is required';
  static const enterYourOtp = 'enter your Otp';
  static const emailValidError = 'Email is invalid';
  static const emailValidError1 = 'Email is invalid';
  static const passwordError = 'Password is required';
  static const newPasswordError = 'newPassword is required';
  static const ConfirmPasswordError = 'confirmPassword is required';
  static const passwordValidError = 'Password is invalid';
  static const reTypePasswordError = 'Re-Type Password is required';
  static const reTypePasswordValidError = 'Re-Type Password is Mismatch';
  static const addressLine1Error = 'Address Line 1 is required';
  static const addressLine2Error = 'Address Line 2 is required';
  static const phoneNumberError = 'Phone Number is required';
  static const phoneNumberValidError = 'Phone Number is invalid';
  static const maritalStatusError = 'Marital Status is required';

  static const ethnicityError = 'Ethnicity is required';
  static const birthDateError = 'Birth Date is required';
  static const postalCodeError = 'PostalCode is required';
  static const noOfKidsError = 'No of Kids is required';
  static const alreadyHaveAnAccount = 'Already have an account? ';
  static const privacyPolicyText =
      'By continuing you agree Rainbow’s Terms of Services & Privacy Policy.';
  static const errorText = 'Error !';
  static const successText = 'success';
  static const single = 'single';
  static const passport = 'passport';
  static const married = 'married';
  static const british = 'British';
  static const indian = 'Indian';
  static const imageFrontError = 'please upload front picture of id';
  static const imageBackError = 'please upload back picture of id';
  static const selfieError = 'please upload selfie';
  static const selfie = 'Selfie Verification';
  static const permanentResidentCard = 'Permanent Resident Card (Front)';
  static const placeYourId = '-Place your ID within the frame';
  static const pleaseMakeSure =
      '-Please make sure it is clear and has no glare';
  static const accCon = 'Accept and Continue';
  static const prepareScan = 'Prepare to scan your face';
  static const scanYourFace = 'Scan your face';
  static const termsConditions = 'Terms and Conditions';
  static const pleaseBlink = 'Please Blink';
  static const makeSure =
      'Make sure you are in a well-lit room \nand hold the phone as shown in the picture';
  static const privacyPolicy =
      'By using Rainbow™, you agree to\nour Terms and Condition and Privacy Policy';
  static const agreementTerms =
      'By tapping accept and continue , I agree to the Terms and Condition and Privacy Policy and i am giving flighteno my concent to use my personal data to: facilitate my transaction and avail of products and services industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\nIt was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.';

  ///___________________________________ Complete your profile ____________________________________
  static const naranataliEmail = 'naranatalie@gmail.com';
  static const completeProfile = 'Complete your profile';
  static const uploadPhotos = 'Upload your photo';
  static const bio = 'Bio';
  static const height = 'Height';
  static const weight = 'Weight';
  static const sorrogateMom = 'Sorrogate Mom';
  static const ageHint = '24';
  static const natalieNara = 'Natalie Nara';
  static const age = 'Age';
  static const h = '5’8';
  static const w = '160 lbs';
  static const feet = 'Feet';
  static const save = 'Save';
  static const lbs = 'Lbs';
  static const inches = 'Inches';
  static const status = 'Status';
  static const instagram = 'Instagram';
  static const instagramUsername = 'Instagram username';
  static const youTube = 'YouTube';
  static const youTubeUserName = 'YouTube username';
  static const faceBook = 'Facebook';
  static const faceBookUserName = 'Facebook username';
  static const twitter = 'Twitter';
  static const twitterUserName = 'Twitter username';
  static const aboutMe = 'About me';
  static const hobbies = 'Hobbies and Interest';
  static const finish = 'Finish';
  static const aboutMeDes =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ';
  static const bioError = 'Enter bio';
  static const statusError = 'Enter status';
  static const instaError = 'Enter instagram';
  static const youtubeError = 'Enter youtube';
  static const faceBookError = 'Enter faceBook';
  static const twitterError = 'Enter twitter';
  static const aboutMeError = 'Enter about';
  static const hobbiesError = 'Enter your hobbies';

  ///___________________________dashboard--Home_______________________________________
  static const aA = "Aa";
  static const postToStories = "Post to Stories";
  static const post = "Post";
  static const camera = "Camera";
  static const addToStory = "Add to story";
  static const writeSomethings = "Write something...";
  static const discover = "Discover";
  static const myStory = "My Story";
  static const scott = "Scott";
  static const seeAll = "See All";
  static const latestFeed = "Latest Feed";
  static const latestFeedDes =
      "Lorem ipsum dolor sit amet, consectetur \nadipiscing elit, sed do eiusmod tempor \nincididunt ut labore et dolore magna aliqua.\n Lorem a commodo consequat ... more ";
  static const likes = "+8 likes";
  static const learnMore = "LEARN MORE";
  static const search = "Search";
  static const discoverOtherConnections = "Discover other connections";
  static const advancedSearch = "Advance Search";
  static const connect = "Connect";
  static const block = "Block";
  static const myCompanyDes =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem a commodo consequat ... more ";

  ///___________________________dashboard--Profile_______________________________________
  static const profile = "Profile";
  static const city = "City";
  static const cityError = "City Name is Required";
  static const streetError = "street Name is Required";
  static const london = "London";
  static const haveKids = "Have kids?";
  static const editProfile = "Edit Profile";
  static const seeMore = "See more";
  static const seeLess = "See less";

  ///________________________SettingScreen____________________________________________
  static const loremIpsum =
      "Lorem Ipsum Is Simply\nDummy Text Of The Printing\nAnd Typesetting Industry.";
  static const pending = "Pending";
  static const complete = "Complete";
  static const sendNewMessage = "Send new Message";
  static const others = "Others";
  static const viewProfile = "View Profile";
  static const messages = "Messages";
  static const connections = "Connections";
  static const support = "Support";
  static const payment = "Payment";
  static const privacy = "Privacy";
  static const notifications = "Notifications";
  static const subscription = "Subscription";
  static const yourReferralCode = "Your Referral Code";
  static const inviteNow = "Invite Now";
  static const logout = "Logout";
  static const connectionRequest = "Connection Request";
  static const suggestedConnection = "Suggested Connection";
  static const addCard = "Add Card";

  ///----------------------------------Payment ---------------------------------
  static const platinum = "Platinum";
  static const manageCards = "Manage Cards";

  ///----------------------------------Advertisement------------------------------
  static const noAdvertisement = "You don't have any \nposted advertisement";
  static const createAdvertisement = "Create Advertisement";

  static const endingIn0212 = "Ending in 0212";
  static const date = "01/23";
  static const cardAddress =
      "3818 Lynden Road , Orono , Ontario , Canda , L0B 1M0";
  static const setasDefaultPayment = "Set as Default Payment";
  static const remove = "Remove";
  static const edit = "Edit";
  static const card01 = "Fianna Wu";
  static const cardminit01 = "2 hr ago";
  static const cardDoller01 = "+\$600.00";
  static const card02 = "Jolina Jones";
  static const cardminit02 = "4 hr ago";
  static const cardDoller02 = "-\$200.00";
  static const card03 = "Wills Smith";
  static const cardminit03 = "4 hr ago";
  static const cardDoller03 = "+\$240.00";
  static const cardobsecure = "• • • •";
  static const carddigits = "0212";
  static const billingInformation = "Billing Information";
  static const address = "Address";
  static const addressHint = "3819 Lynden Road";
  static const cityHint = "Canada";
  static const postalCodeHint = "L0B 1M0";
  static const cardInformation = "Card Information";
  static const nameonCard = "Name on card";
  static const aycanDoganlar = "Aycan Doganlar";
  static const cardNumber = "Card number";
  static const cardNumberHint = "1234 4567 7890 1234";
  static const expiryDate = "Expiry Date";
  static const expiryDateHint = "02/24";
  static const cVV = "CVV";
  static const cVVHint = ". . .";
  static const addresserror = 'Address is required';
  static const cityeError = 'City is required';

  static const countryError = 'Country is Required';
  static const nameonCardError = 'Name on Card is required';
  static const cardnumberError = 'card Number is required';
  static const cardnumberErrorValidation = "Please Currect card Number";
  static const expirydateError = 'expiry date is required';
  static const cVVError = 'cvv is required';
  static const cVVErrorValidation = 'please currect CVV';
  static const removeCard = "Remove Card";
  static const removeDialogDes = "Are you sure you want to remove card?";
  static const removeDialogCancel = "Cancel";
  static const confirm = "Confirm";

  ///----------------------------------SubScription---------------------------
  static const enterPromoCode = "Enter promo code";
  static const subscribe = "Subscribe";
  static const premium = "Premium";
  static const premium01 = "3 months subscription";
  static const whatYoullGet = "What You’ll Get";
  static const unlimitedAccess = "Unlimited access";
  static const dateSupport = "24/7 Support";
  static const textSpan01 = "£24.99";
  static const textspan02 = "/month";

  ///----------------------------------SubScription Payment---------------------------
  static const iAMPROUDMOM = "IAMPROUDMOM";
  static const cardName01 = "Visa Ending in 4151 ";
  static const cardName02 = "Visa Ending in 2151 ";
  static const cardName03 = "Master Card Ending in 4151 ";
  static const cardDate01 = "06/25";
  static const subscriptionPaymenDes = "By Clicking continue below, you accept to be charged at \$24.99/month for a minimum of 3months. You also accept the Terms and condition of Rainbow Love";
  static const continue01 = "Continue";

}