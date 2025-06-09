import 'questionanswer.dart';
class questionbank {
  int count = 0;
  List<questionanswer> Questionanswerbank =
  [
    questionanswer('AI stands for Artificial Intelligence.', true),
    questionanswer('AI can never outperform human intelligence.', false),
    questionanswer('Machine Learning is a subset of AI.', true),
    questionanswer('AI cannot recognize images or sounds.', false),
    questionanswer('Self-driving cars use AI technology.', true),
    questionanswer('AI does not require data to function.', false),
    questionanswer('Deep Learning is based on neural networks.', true),
    questionanswer('Chatbots like ChatGPT are examples of AI.', true),
    questionanswer('AI can write code automatically.', true),
    questionanswer('Robots and AI are the same thing.', false),
    questionanswer('AI can be trained to detect diseases.', true),
    questionanswer('All AI systems are conscious like humans.', false),
    questionanswer('AI is widely used in digital marketing.', true),
    questionanswer('AI cannot be used in education.', false),
    questionanswer('AI is used in face recognition systems.', true),
    questionanswer(
        'Artificial Intelligence is a recent invention of 2023.', false),
    questionanswer('AI can learn from past experiences.', true),
    questionanswer('AI is only used in science fiction movies.', false),
    questionanswer('Voice assistants like Siri use AI.', true),
    questionanswer('AI poses ethical and security challenges.', true),
  ];

  String ? getqeustion() {
    return Questionanswerbank[count].questionstatement;
  }

  bool ? getanswer() {
    return Questionanswerbank[count].answerstatement;
  }

  void NextQuestion() {
    if (count < Questionanswerbank.length - 1) {
      count++;
    }


  }
  bool FinshQuiz(){
    if (count >= Questionanswerbank.length - 1) {
      return true;
    }
    else {
      return false;
    }
  }
  void QuizClose() {
    count = 0;
  }


}