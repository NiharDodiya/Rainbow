class EndPoints {
  ///---------------------------------------------- Api Key ----------------------------------------------
  static const apiKey = 'c6d805c8b0751dab4dfda08908b90ee0';

  ///---------------------------------------------- Base url ----------------------------------------------
  static const baseUrl = 'https://rainbow-api-staging.herokuapp.com/api';

  ///---------------------------------------------- Keys ----------------------------------------------
  static const login = "$baseUrl/user/login";
  static const register = "$baseUrl/user/register";
  static const verificationSocial = "$baseUrl/user/social/login";
  static const companyRegister = "$baseUrl/company/register";
  static const idVerification = "$baseUrl/user/idverification";
  static const selfieVerification = "$baseUrl/user/selfiverification";
  static const verifyCode = "$baseUrl/user/verifycode";
  static const advirtisersRegister = "$baseUrl/advirtisers/register";
  static const createPassword = "$baseUrl/user/createpassword";
  static const createPasswordForAdvertiser = "$baseUrl/advirtisers/changepassword";
  static const mobileCheck = "$baseUrl/user/mobilecheck";
  static const countryList = "$baseUrl/admin/country/list";
  static const nationalitiesList = "$baseUrl/admin/nationalities/list";
  static const uploadImage = "$baseUrl/upload/image";
  static const editProfile = "$baseUrl/user/profile/update";
  static const viewProfile = "$baseUrl/user/profile/view";
  static const privacy = "$baseUrl/user/privacy";
  static const block = "$baseUrl/user/block";
  static const unBlock = "$baseUrl/user/unblock";
  static const blockList = "$baseUrl/user/block/list";
  static const sendFriendRequest = "$baseUrl/user/request/send";
  static const acceptFriendRequest = "$baseUrl/user/request/accept";
  static const adEditProfile = "$baseUrl/advirtisers/profile/update";
  static const listOfFriendRequest = "$baseUrl/user/request/list";
  static const cancelFriendRequest = "$baseUrl/user/request/reject";
  static const deviceToken = "$baseUrl/user/device/update";
  static const suggestionList = "$baseUrl/user/suggestion/list";
  static const requestList = "$baseUrl/user/request/list";
  static const cancelSenderRequest = "$baseUrl/user/request/sender/reject";
  static const logOut = "$baseUrl/user/logout";
  static const unFriendRequest = "$baseUrl/user/unfriend";
  static const storyAdd = "$baseUrl/user/story/add";
  static const myStory = "$baseUrl/user/story/my";
  static const friendStory = "$baseUrl/user/story/friends";
  static const likeStory = "$baseUrl/user/story/like";
  static const unLikeStory = "$baseUrl/user/story/unlike";
  static const commentStory = "$baseUrl/user/story/comment";
  static const commentStoryDelete = "$baseUrl/user/story/comment/delete";
  static const deleteStory = "$baseUrl/user/story/delete";
  static const listTageStory = "$baseUrl/user/tag/list";
  static const storyView = "$baseUrl/user/story/view";
  static const storyViewList = "$baseUrl/user/story/view/list";
  static const notificationList = "$baseUrl/user/notification/list";
  static const createPost = "$baseUrl/user/post/create";
  static const myPostList = "$baseUrl/user/post/my/list";
  static const sharePost = "$baseUrl/user/post/share";
  static const postLike = "$baseUrl/user/post/like";
  static const unlikePost = "$baseUrl/user/post/unlike";
  static const postView = "$baseUrl/user/post/view";
  static const friendPostList = "$baseUrl/user/post/friend/list";
  static const lat = "lat=";
  static const lon = "lon=";
  static const appId = "appid=";
}
