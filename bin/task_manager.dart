

class User {

  User(this.name, this.email, this.pwd);

  String name;
  String email;
  String pwd;

  Report report = Report();

  static List<Task> taskList = [];



  void logIn (String email, String pwd){
    if(this.email == email && this.pwd == pwd){
      print("You have successfully logged in");
    }else{
      print("Invalid email or password");
    }
  }

  void logOut(){
    print("You have logged out");
  }

  void createTask(String title, String description, {DateTime? deadline}){
    taskList.add(Task(title,description, deadline: deadline));
  }

  void deleteTask(Task task){
    taskList.remove(task);
    Task.tskCount--;
    print("Task deleted");
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

  Task(this.title, this.description, {this.deadline}){
    Task.tskCount++;
  }

 static int tskCount = 0;
 
  String title;
  String description;
  DateTime? deadline;
  TaskStatus tskStatus = TaskStatus.pending;
  String category = taskCategories[0];
  
  

  

  void addCategory(String name){
    taskCategories.add(name);
  }

  // All editing methods:
  void editTitle(String title){
    this.title = title;
  }

  void editDescription(String description){
    this.description = description;
  }

  void editDeadaline(DateTime deadline){
    this.deadline = deadline;
  }

  void editTskStatus(TaskStatus tskStatus){
    this.tskStatus = tskStatus;
  }

  void editCategory(String category){
    if(taskCategories.contains(category)){
      this.category = category;
    } else {
      taskCategories.add(category);
      this.category = category;
    }
  }

  // TODO: find a way to make this method run in the background without being invoked later.
  void notifier(){
    if(deadline != null){
      DateTime now = DateTime.now();
      Duration difference = deadline!.difference(now);
      if(difference.inDays <= 2){
        print("Deadline for $title is nearing");
      }
    }
  }
}


class Report {
  
  void printReport(){
    String title = "Summary of all Tasks:";
    int pendingTaskCount = 0;
    int completedTaskCount = 0;
    int inProgressTaskCount = 0;

    for (Task task in User.taskList){
      if(task.tskStatus == TaskStatus.pending){
        pendingTaskCount ++;
      } else if(task.tskStatus == TaskStatus.completed){
        completedTaskCount ++;
      }else if (task.tskStatus == TaskStatus.inProgress){
        inProgressTaskCount ++;
      }
    }

    print("$title \n Total number of tasks = ${Task.tskCount} \n Pending tasks: $pendingTaskCount \n In progress tasks: $inProgressTaskCount \n Completed tasks: $completedTaskCount");
  }


  // Copilot solution for printing by category
  void printByCategory() {
  // Map each category to its list of tasks
  Map<String, List<Task>> taskGroups = {};

  for (Task task in User.taskList) {
    // If category doesn't exist yet, initialize it
    taskGroups.putIfAbsent(task.category, () => []);

    // Add the task to the right category list
    taskGroups[task.category]!.add(task);
  }

  // Now print a report for each category
  taskGroups.forEach((category, tasks) {
    int pending = 0;
    int completed = 0;
    int inProgress = 0;

    for (Task task in tasks) {
      if (task.tskStatus == TaskStatus.pending) {
        pending++;
      } else if (task.tskStatus == TaskStatus.completed) {
        completed++;
      } else if (task.tskStatus == TaskStatus.inProgress) {
        inProgress++;
      }
    }

    print("Category: $category");
    print("  Pending: $pending");
    print("  In Progress: $inProgress");
    print("  Completed: $completed\n");
  });
}


  /*
  void printByCategory(){
    List<List<Task>> taskGroups;
    for (Task task in User.taskList){
      if (task.category == taskCategories[0]){
        taskGroups[0]= List<Task> Work;
        switch(task.tskStatus){
        case TaskStatus.pending: taskGroups[0] = List<Task> work;
      }
      
      }
    }
  }
  */
  /*
  void printReportByCategory(){
    Map<String, String> categoryList = {};
    for (String category in taskCategories){
      categoryList["name"] = category;
    }
    categoryList.foreach((key, value) {
      List<Task> categoryList.vlaue;
    }
    );
    
  }
  */
}



