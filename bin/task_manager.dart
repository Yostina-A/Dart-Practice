
class User{

  User(this.name, this.email, this._pwd);

  String name;
  String email;
  String _pwd;
  Report report = Report();

  void authenticate (String email, String pwd){
    if(email == email && pwd ==_pwd){
      print("You have successfully logged in");
    }else{
      print("Invalid email or password");
    }
  }

  void generateReport(){
    report.printReport();
  }
}


enum TaskStatus{
  pending, inProgress, completed;

  String get label{
    switch(this){
      case TaskStatus.pending: return "Pending";
      case TaskStatus.inProgress: return "In Progress";
      case TaskStatus.completed: return "Completed";
    }
  } 
}

List<String> taskCategories = ["Work", "Personal", "Urgent"];

class Task{

  Task(this.title, this.description, this.tskStatus, {this.deadline});

  String title;
  String description;
  DateTime? deadline;
  TaskStatus tskStatus;
  String category = taskCategories[0];
  static int tskCount = 0;
  

  tskCount++;

  void addCategory(String name){
    taskCategories.add(name);
  }

  // All editing methods:
  void editTitle(String title){
    title = title;
  }

  void editDescription(String description){
    description = description;
  }

  void editDedaline(DateTime date){
    date = date;
  }

  void editTskStatus(TaskStatus tskStatus){
    tskStatus = tskStatus;
  }

  void editCategory(String category){
    if(taskCategories.contains(category)){
      category = category;
    } else {
      taskCategories.add(category);
      this.category = category;
    }
  }

  // TODO: find a way to make this method run in the background without being invoked.
  void notifier(){
    if(deadline != null){
      DateTime now = DateTime.now();
      Duration difference = deadline!.difference(now);
      if(difference.inDays <= 2){
        print("Deadline for $title is nearing");
      }
    }
  }

  // to delete a task
  void deleteTask(){
    print("Task deleted");
    tskCount--;
  }
}


class Report {

  String title = "Summary of all Tasks:";
  int tskNums = Task.tskCount;
  
  void printReport(){
    print("$title \n Total number of tasks = $tskNums");
  }

}



