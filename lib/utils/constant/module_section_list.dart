import '../../models/module_section_model.dart';

List<ModulSectionModel> moduleSection = [
  ModulSectionModel(
      id: 1,
      title: "Pengenalan",
      video: true,
      material: false,
      assignment: true,
      quiz: false,
      finished: true),
  ModulSectionModel(
    id: 2,
    title: "Section 2",
    video: true,
    material: true,
    assignment: true,
    quiz: true,
    finished: true,
  ),
  ModulSectionModel(
    id: 3,
    title: "Section 3",
    video: true,
    material: true,
    assignment: true,
    quiz: true,
    finished: false,
  ),
  ModulSectionModel(
    id: 4,
    title: "Section 4",
    video: true,
    material: true,
    assignment: true,
    quiz: true,
    finished: false,
  )
];
