class ApiConstants {
  // static const String baseUrl = "http://13.48.213.220";

  static const String baseUrl = "https://personaltrainerkmm.com";
  // static const String baseUrl = "https://10.0.2.2:8000";

  // static const String baseUrl = "http://localhost:8000";

  static const String api = "api";

  static const String apiUrl = '$baseUrl/$api';

  static const String createCardioRecord = '$apiUrl/create-cardio-record';
  static const String allCardioWithCategories =
      '$apiUrl/all-cardios-with-categories';

  static const String updateWeight = '$apiUrl/update-weight';

  static const String home = '$apiUrl/home';
  static const String deleteIngredient =
      '$apiUrl/delete-ingredient-from-diet-meal';

  static const String dietMeal = '$apiUrl/diet-meal';
  static const String authurl = '$apiUrl/auth';
  static const String getIngredients = '$apiUrl/all-ingredients';
  static const String addIngredients = '$apiUrl/add-ingredient-to-diet-meal';

// meals action
  static const String deleteusermeal = '$apiUrl/delete-user-meal';
  static const String restoreMeal = '$apiUrl/restore-meal';

  static const String replaceIngredient = '$apiUrl/replace-ingredient';

  static const String skipMeal = '$apiUrl/toggle-meal-skip';
  static const String markMealDone = '$apiUrl/toggle-meal-done';
  static const String replaceMeal = '$apiUrl/replace-diet-meal';

  static const String addMeal = '$apiUrl/add-new-diet-meal';
  static const String repeatMeal = '$apiUrl/update-meal-repetition';

  static const String sortMeal = '$apiUrl/sort-meals';

  // auth
  static const String login = '$authurl/login';

  static const String register = '$authurl/register';

  static const String forgetPasswordFirstStep =
      '$authurl/forget-password-step1';

  static const String forgetPasswordSecondStep =
      '$authurl/forget-password-step2';

// verf email
  static const String resendVerfEmail = '$authurl/resend-verification-mail';
  static const String getProfile = '$apiUrl/profile';

  // updateprofile
  static const String profileurl = apiUrl;

  static const String updateProfile = '$profileurl/update-profile';

  //browse trainnig programs

  static const String getTrainingCatgeory = '$apiUrl/select-training-category';
  static const String selectTrainingWeek = '$apiUrl/select-training-weeks';

  static const String selectTrainingDays = '$apiUrl/select-training-days';

  static const String selectExcericsofDay = '$apiUrl/select-training-exercise';

// training Program
  static const String trainingTableWeek = '$apiUrl/training-weeks';
  static const String trainingDayView = '$apiUrl/training-day';
  static const String allDaysPerWeek = '$apiUrl/all-days-per-week';
  static const String allTrainingWeekinCategory = '$apiUrl/all-training-weeks';
  static const String currDaysPerWeek = '$apiUrl/curr-days-per-week';

//trianng action

  static const String restartWeek = '$apiUrl/reset-user-training-week';
  static const String repeatWeek = '$apiUrl/repeat-user-training-week';

    static const String updateSessionWeight = '$apiUrl/update-session-weight';
    static const String trainingdaydone = '$apiUrl/training-day-done';
    static const String trainingdayexercisedone = '$apiUrl/training-day-exercise-done';
    static const String deleteExerciseFromTrainingDay = '$apiUrl/delete-exercise-from-training-day';
    static const String allexercisecategorieswithExercises = '$apiUrl/all-exercise-categories-with-exercises';
    static const String addExcericse = '$apiUrl/add-exercises-to-training-day';
    static const String usertrainingexercisestatistics = '$apiUrl/user-training-exercise-statistics';

    static const String recoverusertrainingweekday = '$apiUrl/recover-user-training-week-day';

// couponsssss

    static const String allcoupons = '$apiUrl/all-coupons';
    static const String buycoupon = '$apiUrl/buy-coupon';
    static const String usecoupon = '$apiUrl/use-coupon';
    static const String mycoupons = '$apiUrl/my-coupons';
    static const String requestCoupon = '$apiUrl/request-coupon';


    static const String resultsgraphp1 = '$apiUrl/results-graph';
    static const String resultsgraphp2 = '$apiUrl/results-graph-p2';
  
  
    static const String updateCups = '$apiUrl/update-water';

    static const String updatesteps = '$apiUrl/update-steps';

        static const String chatgetmsgs = '$apiUrl/chat';
        static const String sendmessage = '$apiUrl/send-message';

// settingss
        static const String updateprofile = '$apiUrl/update-profile';
        static const String updateProgram = '$apiUrl/update-program';
        static const String contactUs = '$apiUrl/contact-us';
        static const String deleteacc = '$apiUrl/delete-acc';

}
