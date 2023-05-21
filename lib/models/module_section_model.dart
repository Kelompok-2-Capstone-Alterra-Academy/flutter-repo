class ModulSectionModel {
  int? id;
  String? title;
  bool? video;
  bool? material;
  bool? assignment;
  bool? finished;

  ModulSectionModel({
    this.id,
    this.title,
    this.video,
    this.material,
    this.assignment,
    this.finished,
  });
}

List<ModulSectionModel> moduleSection = [
  ModulSectionModel(
      id: 1,
      title: "Pengenalan",
      video: true,
      material: false,
      assignment: true,
      finished: true),
  ModulSectionModel(
    id: 2,
    title: "Section 2",
    video: true,
    material: true,
    assignment: true,
    finished: true,
  ),
  ModulSectionModel(
    id: 3,
    title: "Section 3",
    video: true,
    material: true,
    assignment: true,
    finished: false,
  ),
];
