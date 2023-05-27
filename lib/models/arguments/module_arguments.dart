class ModuleListQuizArguments {
  final String courseName;

  ModuleListQuizArguments(this.courseName);
}

class ModuleDetailVideoArguments {
  final String courseName;
  final String sectionName;

  ModuleDetailVideoArguments(this.courseName, this.sectionName);
}

class ModuleDetailTaskArguments {
  final String courseName;
  final String sectionName;
  final int numbering;

  ModuleDetailTaskArguments(this.courseName, this.sectionName, this.numbering);
}

class ModuleArguments {
  final String title;
  final int currentSection;
  final int totalSection;

  ModuleArguments(this.title, this.currentSection, this.totalSection);
}
