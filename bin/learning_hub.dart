// Mixins

mixin LoginLogout{
  String get email;
  String get pwd;

  void login(String email, String pwd){
    if(this.email == email && this.pwd == pwd){
      print("You have logged in successfuly");
    } else {
      print("Invalid credentials!");
    }
  }

  void logout(){
    print("You have logged out.");
  }
} 


//-------------------------------------------------------------------------------------------------------

//User Classes

class User {

  User(this.name){
    userCount ++;
  }

  static int userCount = 0;

  String name;
  List<Course> enroledCourses = [];
  int finLessons = 0;

  void enrolCourse(String name, describ, CourseDif dif){
    enroledCourses.add(Course(name, describ, dif));
  }

  String? studyLesson(Course course){
    if (course.isFinished()){return "Course is finished.";}
    for (var lesson in course.lessons.entries){ // you must use ".entries" in a map so that the loop checks each key value pair
      if (lesson.value == true){
          continue;
      }
      course.lessons[lesson.key] = true;
      course.countFinishedLessons();
      finLessons ++;
      return lesson.key; // figure out a way to to return first before the previous logic.
  } return null;
  }

  void generateReport(){
    Report report = Report();
    report.createReport(this);
  }

}


class RegularUser extends User with LoginLogout{

  RegularUser(super.name, this.email, this.pwd);

  @override
  String email;
  @override
  String pwd;

  void logIn(String email, String pwd){
    login(email, pwd);
  }

  void logOut(){
    logout();
  }

}

class GuestUser extends User {

  GuestUser(super.name);

}

class AdminUser extends User with LoginLogout{

  AdminUser(super.name, this.email, this.pwd);

  @override
  String email;
  @override
  String pwd;

  void logIn(String email, String pwd){
    login(email, pwd);
  }

  void logOut(){
    logout();
  }

}

// -----------------------------------------------------------------------------------------------------------------
// Course class

enum CourseDif {easy, medium, hard}

class Course {

  Course(this.name, this.describ, this.dif){
    courCount ++;
  }

  static int courCount = 0;
  
  String name;
  String describ;
  CourseDif dif;
  Map<String, bool> lessons = {};
  int finCourseLessons = 0;


  void addLesson(String name, {bool notDone = false}){
    lessons[name] = notDone;
  }

  void countFinishedLessons(){
    for (var lesson in lessons.entries){
      if(lesson.value == true){finCourseLessons ++;}
    }
  }

  double compPercent(){
    return (finCourseLessons/lessons.length) * 100 ;
  }

    String? milStoneNotify(){
      double progress = compPercent();
      if(progress == 100){
        return "you have finished this course";
      }else if (progress >= 75 && progress < 100){
          return "You have finished 75% of the course.";
      } else if (progress >= 50 && progress < 75 ){
          return "You have finished 50% of the course";
      } else if (progress >= 25 && progress < 50){
          return "You have finsihed 25% of the course";
      } else {
         return null;
      }
    }


    bool isFinished(){
      for (var lesson in lessons.entries){
        if(lesson.value == false){return false;}
      }
      return true;
    }
}


//-------------------------------------------------------------------------------------------------
// report class

// needs a list of course in users
// needs a list of finished lessons in user
class Report {

  void createReport(User user){
    int enCourseCount = user.enroledCourses.length;
    int finLessonsCount = user.finLessons;
    int finCourseCount = 0;

    for (var course in user.enroledCourses){
      if (course.isFinished()) {finCourseCount ++;}
    }
    print(
      "Total number of enrolled courses: $enCourseCount \n" 
      "Number of finished courses: $finCourseCount \n"
      "Total number of finished lessons: $finLessonsCount");
  }
}