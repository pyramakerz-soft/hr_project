// ignore_for_file: constant_identifier_names

enum RequestStates {
  initial,
  loading,
  acountExists,
  error,
  loaded,

  anotherIntial,
  rebuildState,
}

enum ChatGptStates {
  initial,
  sendMessageLoading,

  reciveMessage,
  error,
}

enum EditAcountEnumStates {
  initial,
  loading,
  acountExists,
  error,
  loaded,
  ImageSizeErrorLoved,
  ImageSizeErrorUser,

  anotherIntial,
  rebuildState,
}

enum DialogEnum { medication, task, Apointment }

enum OAuthStateEnums {
  initial,
  loading,
  error,
  acountExists,
  noAcountExistsGoogle,
}

enum DashboardGetProfileStates {
  initial,
  loading,
  loaded,
  error,
  userdeleteAcount,

  anotherIntial,
  rebuildState,
}
