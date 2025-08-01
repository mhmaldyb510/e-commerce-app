// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Welcome to `
  String get sayWelcome {
    return Intl.message('Welcome to ', name: 'sayWelcome', desc: '', args: []);
  }

  /// `Discover a unique shopping experience with ProductsHUB. Explore our wide range of high-quality products and get the best deals and exceptional service.`
  String get onboardingDetails1 {
    return Intl.message(
      'Discover a unique shopping experience with ProductsHUB. Explore our wide range of high-quality products and get the best deals and exceptional service.',
      name: 'onboardingDetails1',
      desc: '',
      args: [],
    );
  }

  /// `Search and Shop`
  String get onboardingHead2 {
    return Intl.message(
      'Search and Shop',
      name: 'onboardingHead2',
      desc: '',
      args: [],
    );
  }

  /// `We offer you the best variety of products. Check the details, images, and reviews to ensure you choose the perfect product.`
  String get onboardingDetails2 {
    return Intl.message(
      'We offer you the best variety of products. Check the details, images, and reviews to ensure you choose the perfect product.',
      name: 'onboardingDetails2',
      desc: '',
      args: [],
    );
  }

  /// `Start now`
  String get startNow {
    return Intl.message('Start now', name: 'startNow', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `New Account`
  String get newAccount {
    return Intl.message('New Account', name: 'newAccount', desc: '', args: []);
  }

  /// `Create New Account`
  String get createNewAccount {
    return Intl.message(
      'Create New Account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message('Or', name: 'or', desc: '', args: []);
  }

  /// `Sign in with Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Facebook`
  String get signInWithFacebook {
    return Intl.message(
      'Sign in with Facebook',
      name: 'signInWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Apple`
  String get signInWithApple {
    return Intl.message(
      'Sign in with Apple',
      name: 'signInWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Please enter email`
  String get pleaseEnterEmail {
    return Intl.message(
      'Please enter email',
      name: 'pleaseEnterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid email`
  String get pleaseEnterValidEmail {
    return Intl.message(
      'Please enter valid email',
      name: 'pleaseEnterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter password`
  String get pleaseEnterPassword {
    return Intl.message(
      'Please enter password',
      name: 'pleaseEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password should be at least `
  String get passwordShouldBeAtLeast {
    return Intl.message(
      'Password should be at least ',
      name: 'passwordShouldBeAtLeast',
      desc: '',
      args: [],
    );
  }

  /// `characters`
  String get characters {
    return Intl.message('characters', name: 'characters', desc: '', args: []);
  }

  /// `Please enter name`
  String get pleaseEnterName {
    return Intl.message(
      'Please enter name',
      name: 'pleaseEnterName',
      desc: '',
      args: [],
    );
  }

  /// `Name should be at least `
  String get nameShouldBeAtLeast {
    return Intl.message(
      'Name should be at least ',
      name: 'nameShouldBeAtLeast',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `By creating an account , you agree to our | Terms and Conditions`
  String get byCreatingAccount {
    return Intl.message(
      'By creating an account , you agree to our | Terms and Conditions',
      name: 'byCreatingAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry, just enter your email and we will send a verification code.`
  String get verificationCodePrompt {
    return Intl.message(
      'Don\'t worry, just enter your email and we will send a verification code.',
      name: 'verificationCodePrompt',
      desc: '',
      args: [],
    );
  }

  /// `?`
  String get questionMark {
    return Intl.message('?', name: 'questionMark', desc: '', args: []);
  }

  /// `Code Verification`
  String get codeVerification {
    return Intl.message(
      'Code Verification',
      name: 'codeVerification',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code sent to this email`
  String get enterCodeSentToEmail {
    return Intl.message(
      'Enter the code sent to this email',
      name: 'enterCodeSentToEmail',
      desc: '',
      args: [],
    );
  }

  /// `Resend the Code`
  String get resendCode {
    return Intl.message(
      'Resend the Code',
      name: 'resendCode',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message('Create', name: 'create', desc: '', args: []);
  }

  /// `Create New Password for Sign In`
  String get createNewPasswordForSignIn {
    return Intl.message(
      'Create New Password for Sign In',
      name: 'createNewPasswordForSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning !..`
  String get goodMorning {
    return Intl.message(
      'Good Morning !..',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Search for.......`
  String get searchFor {
    return Intl.message(
      'Search for.......',
      name: 'searchFor',
      desc: '',
      args: [],
    );
  }

  /// `Most Popular`
  String get mostPopular {
    return Intl.message(
      'Most Popular',
      name: 'mostPopular',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `Reviews`
  String get reviews {
    return Intl.message('Reviews', name: 'reviews', desc: '', args: []);
  }

  /// `Best Sellers`
  String get bestSellers {
    return Intl.message(
      'Best Sellers',
      name: 'bestSellers',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get newNotification {
    return Intl.message('New', name: 'newNotification', desc: '', args: []);
  }

  /// `Mark all as read`
  String get markAllAsRead {
    return Intl.message(
      'Mark all as read',
      name: 'markAllAsRead',
      desc: '',
      args: [],
    );
  }

  /// `In past time`
  String get inPastTime {
    return Intl.message('In past time', name: 'inPastTime', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: 'Label for the home bottom navigation item',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  /// `Our Products`
  String get ourProducts {
    return Intl.message(
      'Our Products',
      name: 'ourProducts',
      desc: '',
      args: [],
    );
  }

  /// `Filter By`
  String get filterBy {
    return Intl.message('Filter By', name: 'filterBy', desc: '', args: []);
  }

  /// `:`
  String get scopeDotes {
    return Intl.message(':', name: 'scopeDotes', desc: '', args: []);
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `To`
  String get to {
    return Intl.message('To', name: 'to', desc: '', args: []);
  }

  /// `Filter`
  String get filter {
    return Intl.message('Filter', name: 'filter', desc: '', args: []);
  }

  /// `Sort By`
  String get sortBy {
    return Intl.message('Sort By', name: 'sortBy', desc: '', args: []);
  }

  /// `Price (Low to High)`
  String get priseLowToHigh {
    return Intl.message(
      'Price (Low to High)',
      name: 'priseLowToHigh',
      desc: '',
      args: [],
    );
  }

  /// `Price (High to Low)`
  String get priseHighToLow {
    return Intl.message(
      'Price (High to Low)',
      name: 'priseHighToLow',
      desc: '',
      args: [],
    );
  }

  /// `Alphabetically`
  String get alphabetically {
    return Intl.message(
      'Alphabetically',
      name: 'alphabetically',
      desc: '',
      args: [],
    );
  }

  /// `The Review`
  String get theReview {
    return Intl.message('The Review', name: 'theReview', desc: '', args: []);
  }

  /// `Add to Cart`
  String get addToCart {
    return Intl.message('Add to Cart', name: 'addToCart', desc: '', args: []);
  }

  /// `Shipping`
  String get shipping {
    return Intl.message('Shipping', name: 'shipping', desc: '', args: []);
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Payment`
  String get payment {
    return Intl.message('Payment', name: 'payment', desc: '', args: []);
  }

  /// `Review`
  String get review {
    return Intl.message('Review', name: 'review', desc: '', args: []);
  }

  /// `Free`
  String get free {
    return Intl.message('Free', name: 'free', desc: '', args: []);
  }

  /// `EGP`
  String get egyptianPound {
    return Intl.message('EGP', name: 'egyptianPound', desc: '', args: []);
  }

  /// `Payment on Delivery`
  String get paymentOnDelivery {
    return Intl.message(
      'Payment on Delivery',
      name: 'paymentOnDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Delivery From Place`
  String get deliveryFromPlace {
    return Intl.message(
      'Delivery From Place',
      name: 'deliveryFromPlace',
      desc: '',
      args: [],
    );
  }

  /// `Buy Now and Pay Later`
  String get buyNowAndPayLater {
    return Intl.message(
      'Buy Now and Pay Later',
      name: 'buyNowAndPayLater',
      desc: '',
      args: [],
    );
  }

  /// `Please select a payment method`
  String get pleaseSelectPaymentMethod {
    return Intl.message(
      'Please select a payment method',
      name: 'pleaseSelectPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Please choose the payment method that suits you.`
  String get pleaseChoosePaymentMethod {
    return Intl.message(
      'Please choose the payment method that suits you.',
      name: 'pleaseChoosePaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Choose the appropriate payment method:`
  String get choosePaymentMethod {
    return Intl.message(
      'Choose the appropriate payment method:',
      name: 'choosePaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Floor Number, Apartment Number`
  String get floorAndApartmentNumber {
    return Intl.message(
      'Floor Number, Apartment Number',
      name: 'floorAndApartmentNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter apartment number`
  String get pleaseEnterApartmentNumber {
    return Intl.message(
      'Please enter apartment number',
      name: 'pleaseEnterApartmentNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter address`
  String get pleaseEnterAddress {
    return Intl.message(
      'Please enter address',
      name: 'pleaseEnterAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter city`
  String get pleaseEnterCity {
    return Intl.message(
      'Please enter city',
      name: 'pleaseEnterCity',
      desc: '',
      args: [],
    );
  }

  /// `Save the Address`
  String get saveTheAddress {
    return Intl.message(
      'Save the Address',
      name: 'saveTheAddress',
      desc: '',
      args: [],
    );
  }

  /// `Card Holder Name`
  String get cardHolderName {
    return Intl.message(
      'Card Holder Name',
      name: 'cardHolderName',
      desc: '',
      args: [],
    );
  }

  /// `Card Number`
  String get cardNumber {
    return Intl.message('Card Number', name: 'cardNumber', desc: '', args: []);
  }

  /// `Expiry Date`
  String get expiryDate {
    return Intl.message('Expiry Date', name: 'expiryDate', desc: '', args: []);
  }

  /// `Make as Default Card`
  String get makeAsDefaultCard {
    return Intl.message(
      'Make as Default Card',
      name: 'makeAsDefaultCard',
      desc: '',
      args: [],
    );
  }

  /// `Confirm the Order`
  String get confirmTheOrder {
    return Intl.message(
      'Confirm the Order',
      name: 'confirmTheOrder',
      desc: '',
      args: [],
    );
  }

  /// `Please enter card name`
  String get pleaseEnterCardName {
    return Intl.message(
      'Please enter card name',
      name: 'pleaseEnterCardName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter card number`
  String get pleaseEnterCardNumber {
    return Intl.message(
      'Please enter card number',
      name: 'pleaseEnterCardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Card number should be at least `
  String get cardNumberShouldBeAtLeast {
    return Intl.message(
      'Card number should be at least ',
      name: 'cardNumberShouldBeAtLeast',
      desc: '',
      args: [],
    );
  }

  /// `Please enter expiry date`
  String get pleaseEnterExpiryDate {
    return Intl.message(
      'Please enter expiry date',
      name: 'pleaseEnterExpiryDate',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid expiry date`
  String get pleaseEnterValidExpiryDate {
    return Intl.message(
      'Please enter valid expiry date',
      name: 'pleaseEnterValidExpiryDate',
      desc: '',
      args: [],
    );
  }

  /// `Please enter CVV`
  String get pleaseEnterCvv {
    return Intl.message(
      'Please enter CVV',
      name: 'pleaseEnterCvv',
      desc: '',
      args: [],
    );
  }

  /// `CVV should be at least `
  String get cvvShouldBeAtLeast {
    return Intl.message(
      'CVV should be at least ',
      name: 'cvvShouldBeAtLeast',
      desc: '',
      args: [],
    );
  }

  /// `Order Summary`
  String get orderSummary {
    return Intl.message(
      'Order Summary',
      name: 'orderSummary',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal:`
  String get subtotal {
    return Intl.message('Subtotal:', name: 'subtotal', desc: '', args: []);
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Please confirm your order`
  String get pleaseConfirmYourOrder {
    return Intl.message(
      'Please confirm your order',
      name: 'pleaseConfirmYourOrder',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Shipping Address`
  String get shippingAddress {
    return Intl.message(
      'Shipping Address',
      name: 'shippingAddress',
      desc: '',
      args: [],
    );
  }

  /// `Apartment Number`
  String get apartmentNumber {
    return Intl.message(
      'Apartment Number',
      name: 'apartmentNumber',
      desc: '',
      args: [],
    );
  }

  /// `Place Order`
  String get placeOrder {
    return Intl.message('Place Order', name: 'placeOrder', desc: '', args: []);
  }

  /// `General`
  String get general {
    return Intl.message('General', name: 'general', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `My Orders`
  String get myOrders {
    return Intl.message('My Orders', name: 'myOrders', desc: '', args: []);
  }

  /// `Payments`
  String get payments {
    return Intl.message('Payments', name: 'payments', desc: '', args: []);
  }

  /// `Favorites`
  String get favorites {
    return Intl.message('Favorites', name: 'favorites', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `Help`
  String get help {
    return Intl.message('Help', name: 'help', desc: '', args: []);
  }

  /// `Who We Are`
  String get whoWeAre {
    return Intl.message('Who We Are', name: 'whoWeAre', desc: '', args: []);
  }

  /// `The Current Password`
  String get theCurrentPassword {
    return Intl.message(
      'The Current Password',
      name: 'theCurrentPassword',
      desc: '',
      args: [],
    );
  }

  /// `The New Password`
  String get theNewPassword {
    return Intl.message(
      'The New Password',
      name: 'theNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm The New Password`
  String get confirmTheNewPassword {
    return Intl.message(
      'Confirm The New Password',
      name: 'confirmTheNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Save The Changes`
  String get saveTheChanges {
    return Intl.message(
      'Save The Changes',
      name: 'saveTheChanges',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Order Number`
  String get orderNumber {
    return Intl.message(
      'Order Number',
      name: 'orderNumber',
      desc: '',
      args: [],
    );
  }

  /// `Order Done`
  String get orderDone {
    return Intl.message('Order Done', name: 'orderDone', desc: '', args: []);
  }

  /// `Order Count`
  String get orderCount {
    return Intl.message('Order Count', name: 'orderCount', desc: '', args: []);
  }

  /// `Track Order`
  String get orderTrack {
    return Intl.message('Track Order', name: 'orderTrack', desc: '', args: []);
  }

  /// `Order Accepted`
  String get orderAccepted {
    return Intl.message(
      'Order Accepted',
      name: 'orderAccepted',
      desc: '',
      args: [],
    );
  }

  /// `Order Shipped`
  String get orderShipped {
    return Intl.message(
      'Order Shipped',
      name: 'orderShipped',
      desc: '',
      args: [],
    );
  }

  /// `Out for Delivery`
  String get outForDelivery {
    return Intl.message(
      'Out for Delivery',
      name: 'outForDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get delivered {
    return Intl.message('Delivered', name: 'delivered', desc: '', args: []);
  }

  /// `Add New Card`
  String get addNewCard {
    return Intl.message('Add New Card', name: 'addNewCard', desc: '', args: []);
  }

  /// `Please enter phone`
  String get pleaseEnterPhone {
    return Intl.message(
      'Please enter phone',
      name: 'pleaseEnterPhone',
      desc: '',
      args: [],
    );
  }

  /// `Phone should be at least `
  String get phoneShouldBeAtLeast {
    return Intl.message(
      'Phone should be at least ',
      name: 'phoneShouldBeAtLeast',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Ok`
  String get ok {
    return Intl.message('Ok', name: 'ok', desc: '', args: []);
  }

  /// `Please accept the terms of use`
  String get pleaseAcceptTheTermsOfUse {
    return Intl.message(
      'Please accept the terms of use',
      name: 'pleaseAcceptTheTermsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `Enter Code`
  String get enterCode {
    return Intl.message('Enter Code', name: 'enterCode', desc: '', args: []);
  }

  /// `Password changed successfully`
  String get passwordChangedSuccessfully {
    return Intl.message(
      'Password changed successfully',
      name: 'passwordChangedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Results`
  String get results {
    return Intl.message('Results', name: 'results', desc: '', args: []);
  }

  /// `You have `
  String get youHave {
    return Intl.message('You have ', name: 'youHave', desc: '', args: []);
  }

  /// `products on cart`
  String get productsOnCart {
    return Intl.message(
      'products on cart',
      name: 'productsOnCart',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personalInformation {
    return Intl.message(
      'Personal Information',
      name: 'personalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: 'Label for the cart bottom navigation item',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: 'Label for the categories bottom navigation item',
      args: [],
    );
  }

  /// `My Account`
  String get myAccount {
    return Intl.message(
      'My Account',
      name: 'myAccount',
      desc: 'Label for the account bottom navigation item',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: 'Label for the settings bottom navigation item',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
