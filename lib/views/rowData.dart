import '../models/options_question_model.dart';

List<OptionsQuestion> rowData = [
  OptionsQuestion(
    id: '1',
    question: 'hy how to doing!1',
    options: ['nothing', 'option2', 'option3', 'option4'],
    currectAnswer: 'nothing',
    currectAnswerIndex: 0,
  ),
  OptionsQuestion(
    id: '2',
    question: 'hy how to doing!2',
    options: ['nothing', 'option2', 'option3', 'option4'],
    currectAnswer: 'option2',
    currectAnswerIndex: 2,
  ),
  OptionsQuestion(
    id: '3',
    question: 'hy how to doing!3',
    options: ['nothing', 'option2', 'option3', 'option4'],
    currectAnswer: 'option4',
    currectAnswerIndex: 3,
  ),
];

List<Map> quizTypes = [
  {
    "quizTypeName": "4 Option Image",
    "colorCodeLight": "0xFFFF6A59",
    "colorCodeDark": "0xFFEC464A",
    "posterImageUrl":
        "https://cn.i.cdn.ti-platform.com/cnapac/content/2017/showpage/ben-10/sa/showicon.png",
  },
  {
    "quizTypeName": "4 Option Image",
    "colorCodeLight": "0xFFF7B500",
    "colorCodeDark": "0xFFE3A402",
    "posterImageUrl":
        "https://freepngimg.com/thumb/cartoon/36530-9-cartoon-hd.png",
  },
  {
    "quizTypeName": "4 Option Image",
    "colorCodeLight": "0xFF5C7CFF",
    "colorCodeDark": "0xFF4565F6",
    "posterImageUrl":
        "https://freepngimg.com/download/cartoon/36403-7-cartoon-photos.png",
  },
  {
    "quizTypeName": "4 Option Image",
    "colorCodeLight": "0xFF5C7CFF",
    "colorCodeDark": "0xFF4565F6",
    "posterImageUrl":
        "https://cdn.pixabay.com/photo/2018/12/03/21/22/cartoon-3854292_1280.png",
  },
];

// "https://freepngimg.com/download/cartoon/36403-7-cartoon-photos.png",
                    // "https://freepngimg.com/thumb/cartoon/36530-9-cartoon-hd.png",
                    // "https://cdn.pixabay.com/photo/2018/12/03/21/22/cartoon-3854292_1280.png",
                   // "https://cn.i.cdn.ti-platform.com/cnapac/content/2017/showpage/ben-10/sa/showicon.png",