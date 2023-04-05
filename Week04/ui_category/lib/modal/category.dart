import 'dart:convert';

class Category {
  int id;
  String name;
  String description;
  String image;
  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'image': image});
    return result;
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));
}

final List<Category> data = [
  Category(
      id: 1,
      name: "Human Branding Agent",
      image:
          "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/f42fc408-e8da-4b53-a925-95199354a9c6/dfqapr3-d0e5b17f-73a0-4c8a-b214-df20381a26ae.jpg/v1/fill/w_1024,h_683,q_75,strp/truth_beyond_reality_navigating_the_map_of_my_mind_by_oanarinaldi_dfqapr3-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NjgzIiwicGF0aCI6IlwvZlwvZjQyZmM0MDgtZThkYS00YjUzLWE5MjUtOTUxOTkzNTRhOWM2XC9kZnFhcHIzLWQwZTViMTdmLTczYTAtNGM4YS1iMjE0LWRmMjAzODFhMjZhZS5qcGciLCJ3aWR0aCI6Ijw9MTAyNCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.mJuEET-m3V64T6n07p-b7QN0Xd8eI_GXcF9k2C6jqP4",
      description:
          "Dolore dolores laboriosam esse non consequatur at. Est non quis odio repellendus doloremque sed et quis. Rem quo eligendi aut sapiente culpa. Autem accusantium impedit quis impedit suscipit."),
  Category(
      id: 2,
      name: "Human Branding Agent",
      image:
          "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/f42fc408-e8da-4b53-a925-95199354a9c6/dfqapr3-d0e5b17f-73a0-4c8a-b214-df20381a26ae.jpg/v1/fill/w_1024,h_683,q_75,strp/truth_beyond_reality_navigating_the_map_of_my_mind_by_oanarinaldi_dfqapr3-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NjgzIiwicGF0aCI6IlwvZlwvZjQyZmM0MDgtZThkYS00YjUzLWE5MjUtOTUxOTkzNTRhOWM2XC9kZnFhcHIzLWQwZTViMTdmLTczYTAtNGM4YS1iMjE0LWRmMjAzODFhMjZhZS5qcGciLCJ3aWR0aCI6Ijw9MTAyNCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.mJuEET-m3V64T6n07p-b7QN0Xd8eI_GXcF9k2C6jqP4",
      description:
          "Dolore dolores laboriosam esse non consequatur at. Est non quis odio repellendus doloremque sed et quis. Rem quo eligendi aut sapiente culpa. Autem accusantium impedit quis impedit suscipit."),
  Category(
      id: 3,
      name: "Human Branding Agent",
      image:
          "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/f42fc408-e8da-4b53-a925-95199354a9c6/dfqapr3-d0e5b17f-73a0-4c8a-b214-df20381a26ae.jpg/v1/fill/w_1024,h_683,q_75,strp/truth_beyond_reality_navigating_the_map_of_my_mind_by_oanarinaldi_dfqapr3-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NjgzIiwicGF0aCI6IlwvZlwvZjQyZmM0MDgtZThkYS00YjUzLWE5MjUtOTUxOTkzNTRhOWM2XC9kZnFhcHIzLWQwZTViMTdmLTczYTAtNGM4YS1iMjE0LWRmMjAzODFhMjZhZS5qcGciLCJ3aWR0aCI6Ijw9MTAyNCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.mJuEET-m3V64T6n07p-b7QN0Xd8eI_GXcF9k2C6jqP4",
      description:
          "Dolore dolores laboriosam esse non consequatur at. Est non quis odio repellendus doloremque sed et quis. Rem quo eligendi aut sapiente culpa. Autem accusantium impedit quis impedit suscipit.")
];
