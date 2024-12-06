// ignore_for_file: public_member_api_docs, sort_constructors_first
class Quiz {
  final String question;
  final List<String> option;

  Quiz({
    required this.question,
    required this.option,
  });

  //* 1 2 3 4

  //* Getter
  get shuffeldOptions {
    final shuffledOption = List.of(option); //* List copy
    shuffledOption.shuffle(); //* 4 3 2 1
    return shuffledOption;
  }
}
