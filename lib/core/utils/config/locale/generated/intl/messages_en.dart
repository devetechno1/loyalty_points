// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(min) => "Can\'t be less than ${min}";

  static String m1(max) => "Can\'t be more than ${max}";

  static String m2(pageName) => "Page \'${pageName}\' not found in pages";

  static String m3(businessName) => "Welcome to ${businessName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountAlreadyExistsForThatEmail":
            MessageLookupByLibrary.simpleMessage(
                "The account already exists for that email."),
        "areYouSureYouWantToReturnBack": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to return back"),
        "back": MessageLookupByLibrary.simpleMessage("Back"),
        "business_name": MessageLookupByLibrary.simpleMessage("PetroJac"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cantBeLessThan": m0,
        "cantBeMoreThan": m1,
        "clientTookTooLong": MessageLookupByLibrary.simpleMessage(
            "The client took too long to respond."),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "connectedToInternet":
            MessageLookupByLibrary.simpleMessage("Connected to the internet"),
        "date": MessageLookupByLibrary.simpleMessage("Date"),
        "doNotHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account ?"),
        "done": MessageLookupByLibrary.simpleMessage("Done"),
        "empty": MessageLookupByLibrary.simpleMessage("Empty"),
        "enterThePassword":
            MessageLookupByLibrary.simpleMessage("Enter the password"),
        "enterValidEmail":
            MessageLookupByLibrary.simpleMessage("Enter valid E-mail"),
        "enterYourMobileNumber":
            MessageLookupByLibrary.simpleMessage("Enter your mobile number"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "fillField": MessageLookupByLibrary.simpleMessage("fill this field"),
        "forgetPassword":
            MessageLookupByLibrary.simpleMessage("Forget password ?"),
        "fullName": MessageLookupByLibrary.simpleMessage("Full Name"),
        "goBack": MessageLookupByLibrary.simpleMessage("Go back"),
        "hidePassword": MessageLookupByLibrary.simpleMessage("Hide password"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "ifYouReturnNowYouWillLoseAllData":
            MessageLookupByLibrary.simpleMessage(
                "If you return now, you will lose all data!"),
        "logOut": MessageLookupByLibrary.simpleMessage("Log out"),
        "login": MessageLookupByLibrary.simpleMessage("Log in"),
        "loyalty_program_for_PetroJac_oil_shops_and_station_agents_products":
            MessageLookupByLibrary.simpleMessage(
                "A loyalty program for PetroJac oil shops and station agents, where points can be collected with every purchase of PetroJac oil products."),
        "mobileNumber": MessageLookupByLibrary.simpleMessage("Mobile Number"),
        "noData": MessageLookupByLibrary.simpleMessage("No Data"),
        "noInternetConnection":
            MessageLookupByLibrary.simpleMessage("No internet connection"),
        "noUserFoundForThatEmail": MessageLookupByLibrary.simpleMessage(
            "No user found for that email."),
        "notSamePass":
            MessageLookupByLibrary.simpleMessage("Not same password"),
        "pageNameNotFoundInRoutes": m2,
        "pageNotFound": MessageLookupByLibrary.simpleMessage("Page not found"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordProvidedIsTooWeak": MessageLookupByLibrary.simpleMessage(
            "The password provided is too weak."),
        "pressAgainToExit":
            MessageLookupByLibrary.simpleMessage("Press again to exit"),
        "rememberMe": MessageLookupByLibrary.simpleMessage("Remember me"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "selectDate": MessageLookupByLibrary.simpleMessage("Select date"),
        "selectMonth": MessageLookupByLibrary.simpleMessage("Select Month"),
        "serverTookTooLong": MessageLookupByLibrary.simpleMessage(
            "The server took too long to respond."),
        "serverTookTooLongToRespond": MessageLookupByLibrary.simpleMessage(
            "The server took too long to respond."),
        "showPassword": MessageLookupByLibrary.simpleMessage("Show password"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign up"),
        "sslCertificateNotTrusted": MessageLookupByLibrary.simpleMessage(
            "The SSL certificate is not trusted."),
        "stayHere": MessageLookupByLibrary.simpleMessage("Stay here"),
        "theSuppliedAuthCredentialIsIncorrect":
            MessageLookupByLibrary.simpleMessage(
                "The supplied auth credential is incorrect, malformed or has expired."),
        "thereIsProblemWithServerTryAgainLater":
            MessageLookupByLibrary.simpleMessage(
                "There is a problem with the server. Try again later."),
        "totalOrder": MessageLookupByLibrary.simpleMessage("Total Order"),
        "unauthorizedError": MessageLookupByLibrary.simpleMessage(
            "Your session has expired or you are not authorized. Please log in again."),
        "understood": MessageLookupByLibrary.simpleMessage("Understood"),
        "unknown": MessageLookupByLibrary.simpleMessage("Unknown"),
        "unknownErrorOccurred":
            MessageLookupByLibrary.simpleMessage("An unknown error occurred."),
        "welcome_to_businessName": m3,
        "wrongPasswordProvidedForThatUser":
            MessageLookupByLibrary.simpleMessage(
                "Wrong password provided for that user.")
      };
}
