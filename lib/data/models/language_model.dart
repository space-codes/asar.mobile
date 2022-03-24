class Language {
  String name;
  String code;

  Language({required this.name, required this.code});

  static List<Language> getListOfLanguages() {
    List<Language> languages;
    languages = [
      Language(name: "العربية", code: 'ar'),
      Language(name: "English", code: 'en')
    ];
    return languages;
  }
}