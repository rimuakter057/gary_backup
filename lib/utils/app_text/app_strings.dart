import 'package:flutter/cupertino.dart';

class AppText {
  static RegExp passRegexp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.{8,}$)');
  static RegExp emailRegexp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

 /// on boarding text
  // Onboarding / Tagline
  static const String compete = "Compete";
  static const String smarter = "smarter";
  static const String trade = "Trade";
  static const String better = "better";

  // Legal / Policy
  static const String byContinuing = "By continuing, you agree to Traders Connect’s ";
  static const String privacyPolicy = "Privacy Policy";
  static const String termsOfUse = "Terms of Use";
  static const String and = " and ";

///create copier section===============================================================

  static const String login = "Login";
  static const String createAccount = "Create an copier";
  static const String empowerAnalyzeConnect = "Empower. Analyze. Connect";


  // Buttons / Actions
  static const String continueButton = "Continue";
 // static const String createAccount = "Create your copier";

  // OTP / Verification
  static const String otpInfo = "You will receive a code to confirm your identity";

  // Form Fields / Hints
  static const String emailAddress = "Email Address";
  static const String referralCode = "Referral Code (Optional)";
  static const String phoneNumber = "Phone Number";
  static const String countryRegion = "Country/Region";
  static const String fullName = "Full Name";

  // Onboarding / Info
  static const String startTracking =
      "Start tracking your trades and connect with the world’s top traders.";

  ///verify copier section===============================================================


  static const String verifyEmail = "Verify Email";
  static const String verifyYourIdentity = "Verify your identity";

  // Verification
  static const String haventReceivedCode =
      "Haven’t received the code yet? ";
  static const String sendAgain = "Send again";
  static const String or = " or ";
  static const String changeEmailAddress =
      "Change the email address";

  static const String enterSixDigitCode =
      "Enter the 6-digit code we’ve sent to {{email.address}}.";

  ///create secure password==========================================================


  static const String createSecure="Create a Secure Password";
  static const String protectAccount="Protect your copier with a strong password. Minimum 8 Characters, include a number and symbol";

  static const String enterPass="Enter Password";
  static const String reEnterPass="Re Enter Password";
  static const String passStrength='Password strength:';
  static const String strong=' Strong';
  static const String enableTwoFactor="Enable Two-Factor Authentication";
 static const String useFace="Use Face ID";
 static const String wouldYouLike=   "Would you like to use your Face ID instead of signing in manually?";

  static const String yesEnable="Yes, Enable Face Id";
  static const String notNow="Not Now";

  /// choose your plan===========================================================

  static const String choosePlan="Choose Your Plan";
  static const String monthly="Monthly";
  static const String annually="Annually";

  static const String beginner="Beginners";
  static const String popular="Most Popular";
  static const String tradersConnect="TradersConnect";
  static const String parYear="per year,";
  static const String month="month";
  static const String save="save";
  static const String start14Day="Start your 14-day free trial";
  static const String elite="Elite";
  static const String bestValue='Best Value';


  ///login widget========================================================================================

  static const String loginToYourAccount = "Login to your copier";
  static const String fillInformation =
      "Please fill the information to make it easier for us to get to know you";
  static const String password = "Password";
  static const String forgotYourPassword = "Forgot your password?";

/// password recovery==================================================================


  static const String passwordRecovery = "Password Recovery";
  static const String passwordRecoveryDesc =
      "Please enter your email address to receive a recovery link and reset your password";
  static const String forgotEmail = "Forgot email? ";
  static const String contactSupport = "Contact Support";
  static const String requestPasswordLink = "Request password link";

  ///verify otp widget======================================================================


  static const String enterVerificationCode = "Enter Verification Code";

  static const String verifyCode = "Verify Code";


  ///reset password========================================================================

  static const String resetPassword = "Reset Password";
  static const String createNewPassword = "Create a New Password";
  static const String resetPasswordHint = "Protect your copier with a strong password.Minimum 8 characters, include a number and symbol";

///dashboard========================================================================================


  static const String dashboard = "Dashboard";
  static const String account = "Account";
  static const String overview = "Overview";
  static const String linkedAccounts = "Linked Accounts";
  static const String smartInsights = "Smart Insights";

  // Subscription / Upgrade
  static const String unlockProTrader = "Unlock Pro Trader";
  static const String upgrade = "Upgrade";
  static const String advancedAnalyticsAndCopiers =
      "Advanced analytics & 5 copier accounts";

  // Time Filters
  static const String open = "Open";
  static const String week = "Week";
  static const String month = "Month";
  static const String year = "Year";

  // Days
  static const String sun = "Sun";
  static const String mon = "Mon";
  static const String tue = "Tue";
  static const String wed = "Wed";
  static const String thu = "Thu";
  static const String fri = "Fri";
  static const String sat = "Sat";

  // Quantity / Limits
  static const String ten = "10";
  static const String fifty = "50";
  static const String hundred = "100";
  static const String oneFifty = "150";
  static const String fiveHundred = "500";
  static const String oneKPlus = "1k+";

  // Account Status
  static const String active = "Active";
  static const String warning = "Warning";
  static const String atRisk = "At Risk";
  static const String disabled = "Disabled";

  // Trading Metrics
  static const String pnl = "PnL";
  static const String winRate = "Win Rate";

  // Brokers
  static const String exness = "Exness";
  static const String icMarkets = "IC Markets";
  static const String stp = "STP";

  // Accounts
  static const String copiersAccounts = "Copiers Accounts";
  static const String masterAccount2 = "Master Account 2";

  // Insights / Rankings
  static const String bestRoiWindow = "Best ROI Window";
  static const String high = "High";
  static const String topTraders = "Top Traders";
  static const String followers = "Followers";

  // Account Selection / Search
  static const String selectAccount = "Select Account";
  static const String showingAllAccounts =
      "Showing the list of all the accounts";
  static const String search = "Search";
  static const String addAccount = "Add Account";








}
