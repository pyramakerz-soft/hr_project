enum RequestStates {
  initial,
  loading,
  accountExists,
  error,
  loaded,
  anotherInitial,
  rebuildState,
}

enum ChatGptStates {
  initial,
  sendMessageLoading,
  receiveMessage,
  error,
}

enum EditAccountEnumStates {
  initial,
  loading,
  accountExists,
  error,
  loaded,
  imageSizeErrorLoved,
  imageSizeErrorUser,
  anotherInitial,
  rebuildState,
}

enum DialogEnum {
  medication,
  task,
  appointment,
}

enum OAuthStateEnums {
  initial,
  loading,
  error,
  accountExists,
  noAccountExistsGoogle,
}

enum DashboardGetProfileStates {
  initial,
  loading,
  loaded,
  error,
  userDeleteAccount,
  anotherInitial,
  rebuildState,
}
