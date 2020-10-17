import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:slimy_card/slimy_card.dart';

class FarmingUpdatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'RL',
              style: TextStyle(
                  shadows: [
                    Shadow(
                        color: Color(0xfff0a500),
                        offset: Offset(-1, -1),
                        blurRadius: 1)
                  ],
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffffffff)),
            ),
            TextSpan(
              text: ' Farm',
              style: TextStyle(
                  shadows: [
                    Shadow(
                        color: Colors.white,
                        offset: Offset(-1, -1),
                        blurRadius: 1)
                  ],
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                  color: Color(0xfff0a500)),
            ),
          ]),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      body: Container(
        color: Color(0xffffffff),
        // child: ListView.builder(
        //   itemCount: 3,
        //   itemBuilder: (context, index) {
        //     return SimpleFoldingCell.create(
        //       frontWidget: _buildFrontWidget(index),
        //       innerWidget: _buildInnerWidget(index),
        //       cellSize: Size(MediaQuery.of(context).size.width, 125),
        //       padding: EdgeInsets.all(15),
        //       animationDuration: Duration(milliseconds: 300),
        //       borderRadius: 10,
        //       onOpen: () => print('$index cell opened'),
        //       onClose: () => print('$index cell closed'),
        //     );
        //   },
        // ),
        child: ListView(
          children: <Widget>[

            SlimyCard(
              color: Color(0xff7a9bee),
              width: MediaQuery.of(context).size.width*.9,
              topCardHeight: 150,
              bottomCardHeight: 200,
              borderRadius: 15,
              topCardWidget: Text(cropNames[0], style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              ),
              bottomCardWidget: Text(
              'The origin of the durum wheats was probably in the region of Abyssinia,'
                  ' whereas the whole group of soft wheat, which includes the bread wheats,'
                  ' probably originated in the region of Pakistan, SouthWestern and the Southern parts of mountainous Bokhara.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              slimeEnabled: true,
            ),
            SizedBox(
              height: 10,
            ),
            SlimyCard(
              color: Color(0xff7a9bee),
              width: MediaQuery.of(context).size.width*.9,
              topCardHeight: 150,
              bottomCardHeight: 200,
              borderRadius: 15,
              topCardWidget: Text(cropNames[1], style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              ),
              bottomCardWidget: Text(
                'The origin of the durum wheats was probably in the region of Abyssinia,'
                    ' whereas the whole group of soft wheat, which includes the bread wheats,'
                    ' probably originated in the region of Pakistan, SouthWestern and the Southern parts of mountainous Bokhara.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              slimeEnabled: true,
            ),
            SizedBox(
              height: 10,
            ),
            SlimyCard(
              color: Color(0xff7a9bee),
              width: MediaQuery.of(context).size.width*.9,
              topCardHeight: 150,
              bottomCardHeight: 200,
              borderRadius: 15,
              topCardWidget: Text(cropNames[2], style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              ),
              bottomCardWidget: Text(
                'The origin of the durum wheats was probably in the region of Abyssinia,'
                    ' whereas the whole group of soft wheat, which includes the bread wheats,'
                    ' probably originated in the region of Pakistan, SouthWestern and the Southern parts of mountainous Bokhara.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              slimeEnabled: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFrontWidget(int index) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          color: Color(0xff7a9bee),
          alignment: Alignment.topCenter,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  cropNames[index],
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                right: 5,
                bottom: 0,
                child: FlatButton(
                  onPressed: () {
                    final foldingCellState = context
                        .findAncestorStateOfType<SimpleFoldingCellState>();
                    foldingCellState?.toggleFold();
                  },
                  child: Text(
                    "OPEN",
                  ),
                  textColor: Colors.black,
                  color: Colors.white,
                  splashColor: Colors.white.withOpacity(0.5),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildInnerWidget(int index) {
    return Builder(
      builder: (context) {
        return Container(
          color: Color(0xFFecf2f9),
          padding: EdgeInsets.all(10),
          child: Stack(
            children: [
              ListView(
                children:[ Align(
                  alignment: Alignment.center,
                  child: Text(
                    cropDescription[index],
                    style: TextStyle(
                      color: Color(0xFF2e282a),
                      fontSize: 12.0,
                    ),
                  ),
                ),]
              ),
              Positioned(
                right: 5,
                bottom: 0,
                child: FlatButton(
                  onPressed: () {
                    final foldingCellState = context
                        .findAncestorStateOfType<SimpleFoldingCellState>();
                    foldingCellState?.toggleFold();
                  },
                  child: Text(
                    "CLOSE",
                  ),
                  textColor: Colors.white,
                  color: Color(0xff7a9bee),
                  splashColor: Colors.white.withOpacity(0.5),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


List cropNames =['Wheat', 'Rice','Corn'];
List cropDescription = [
  'Introduction: Wheat (Triticum spp.) occupies the prime position among the food crops in the world. In India, it is the second important food crop being next to rice and contributes to the total foodgrain production of the country to the extent of about 25%. Wheat has played a very vital role in stabilizing the foodgrain production in the country over the past few years.'
'The origin of the durum wheats was probably in the region of Abyssinia, whereas the whole group of soft wheat, which includes the bread wheats, probably originated in the region of Pakistan, SouthWestern and the Southern parts of mountainous Bokhara.'
'Classification of Indian Wheats:'
      '1. Emmer Wheat (Triticum dicoccum schub L.):'
      'This type was reported to be grown in south i.e. Maharashtra, Tamil Nadu and Karnataka. This type is believed to be developed from T. diccoides koru., a wild form. It is also grown in Spain, Italy, Germany and Russia.'
      '2. Macroni Wheat ( T.durum Desf.) : The durum or macroni wheat, cultivation in India, is considered to be very old. It is a best wheat for drought conditions or under restricted irrigated conditions of Punjab, M.P., Karnataka, Tamil Nadu, Gujarat, West Bengal and H.P. It is used for semolina (suji) preparation.'
      '3. Common Bread Wheat ( T. vulgare Host):'
      'It is a typical wheat of alluvial soils of Indo-Gangetic plains i.e.Punjab, Uttar Pradesh, Bihar and parts of Rajasthan. The bulk of the Indian crop, therefore, consists of this type.'
      '4. Indian Dwarf Wheat (T.spherococcum Mihi.):'
      'This belongs to the club wheat of western countries. This is found in limited areas of M.P., U.P., of India and in Pakistan. These are characterised by very short and compact heads having a shorter grains.'
      '5. Triticum aestivum:'
      'This is the type presently grown in India in almost all the wheat growing zones. It is used mainly for bread purpose.',
  'About Rice',
  'About Corn'
];