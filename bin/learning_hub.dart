// Mixins

/* mixin LogInLogOut{


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
} */


//-------------------------------------------------------------------------------------------------------

//User Classes

class User {

  User(this.name){
    userCount ++;
  }

  static int userCount = 0;

  String name;
  List enroledCourses = [];
  List finLessons = [];

}


class RegularUser extends User{

  RegularUser(super.name, this.email, this.pwd);

  String email;
  String pwd;



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

class GuestUser extends User {

  GuestUser(super.name);

}

class AdminUser extends User{

  AdminUser(super.name, this.email, this.pwd);

  String email;
  String pwd;



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

  

  double compPercent(){
    double percent= 0.10; // figure out how to compute the completetion percentage
    return percent;
  }

    String? milStoneNotify(){
      double progress = compPercent();
      if(progress == 1){
        return "you have finished this course";
      }else if (progress == 0.75){
          return "You have finished 75% of the course.";
      } else if (progress == 0.50){
          return "You have finished 50% of the course";
      } else if (progress == 0.25){
          return "You have finsihded 25% of the coutrse";
      } else {
         return null;
      }
    }
}


//-------------------------------------------------------------------------------------------------
// report class

// need a list of course in users
// need a list of finished lessons in user
class Report {
  int enCourseCount = 0;
  int finLessonsCount = 0;
  int finCourseCount = 0;

  void createReport(){
    print("Total number of enrolled courses: $enCourseCount \n Number of finished courses: $finCourseCount \n Number of finished lessons: $finLessonsCount");
  }
}