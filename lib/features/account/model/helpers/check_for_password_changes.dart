bool checkForPasswordChanges(
  String currentPassword,
  String newPassword,
  String confirmPassword,
) {
  bool passwordChanged =
      !(currentPassword.isEmpty &&
              newPassword.isEmpty &&
              confirmPassword.isEmpty ||
          currentPassword == '' && newPassword != '' && confirmPassword != '');

  return passwordChanged;
}
