class OnBoardingModel {
  final String flower_name;
  final String flower_link;

  OnBoardingModel({required this.flower_name, required this.flower_link});

  static List<OnBoardingModel> getOnBoardingModelList() {
    List<OnBoardingModel> onBoardingModelList = [];
    onBoardingModelList.add(OnBoardingModel(flower_name:'Strlitzia', flower_link:'https://www.linkpicture.com/q/strelitzia.png'));
    onBoardingModelList.add(OnBoardingModel(flower_name:'Netted Iris', flower_link:'https://www.linkpicture.com/q/nettediris.png'));
    onBoardingModelList.add(OnBoardingModel(flower_name:'Helianthas', flower_link:'https://www.linkpicture.com/q/helianthas.png'));
    return onBoardingModelList;
  }
}
