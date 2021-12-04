import 'package:comic_book_app/services/layout_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:comic_book_app/models/details_comic_response.dart';
import 'package:comic_book_app/services/comic_provider.dart';

class GridDetails extends StatelessWidget {
  final int columns;
  final ResultDetails dataComic;

  const GridDetails({required this.columns, required this.dataComic});
  

  @override
  Widget build(BuildContext context) {
  
    final size = MediaQuery.of(context).size;
    return  Column(
      children: [
        subtitle(size, context, 'Characters'),
        gridFunction('characters',context),
        subtitle(size, context, 'Teams'),
        gridFunction('teams',context),
        subtitle(size, context, 'Locations'),
        gridFunction('locations',context),
       
      ],
    );
  }

  Container subtitle(Size size, BuildContext context, String subtitle) {
    return Container(
      margin: EdgeInsets.only(top:10),
      padding: EdgeInsets.only(top: 5,bottom: 5),
        alignment: Alignment.bottomLeft,
        width: size.width*0.9,
        height: size.width*0.1,
        //color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text( subtitle, maxLines: 2, style: Theme.of(context).textTheme.headline4, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
            Expanded(child: Divider(height: 15,color:  Colors.black))
          ],
        )
      );
  }

  GridView gridFunction(String typeGrid, BuildContext context) {
    final layoutProvider = Provider.of<LayoutProvier>(context, listen: false);
    return GridView.builder(
          //reverse: true,
          itemCount  : typeGrid=='characters'?this.dataComic.characterCredits!.length
                     : typeGrid=='teams'?this.dataComic.teamCredits!.length
                     : this.dataComic.locationCredits!.length,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.0,
            mainAxisExtent: layoutProvider.isTablet?70:50
          ),
          itemBuilder: (BuildContext context, int i){
            String urlImageCharacter = typeGrid=='characters'?this.dataComic.characterCredits![i].apiDetailUrl!.characters.toString()
                                     :typeGrid=='teams'?this.dataComic.teamCredits![i].apiDetailUrl.toString()
                                     :this.dataComic.locationCredits![i].apiDetailUrl.toString();   
            return cardComic(
                  typeGrid=='characters'?this.dataComic.characterCredits![i]
                  :typeGrid=='teams'?this.dataComic.teamCredits![i]
                  :this.dataComic.locationCredits![i], 
                  context,
                  urlImageCharacter, typeGrid);
          },);
  }

  Widget cardComic(final data, BuildContext context, String urlImageCharacter,String typeGrid){
    final size = MediaQuery.of(context).size;
    final ComicsProvider comicsProviders = Provider.of<ComicsProvider>(context, listen: false);
    final layoutProvider = Provider.of<LayoutProvier>(context, listen: false);
    return Container(
      padding: EdgeInsets.only(left: layoutProvider.isTablet?size.width*0:size.width*0.05),
      //color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          getImage(comicsProviders, urlImageCharacter, size, typeGrid),
          SizedBox(width: layoutProvider.isTablet?size.width*0.01:size.width*0.02),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              width: layoutProvider.isTablet?size.width*0.15:size.width*0.23,
              //color: Colors.red,
              child: Text( data.name! , maxLines: 2, style: Theme.of(context).textTheme.headline5, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,)),
          )
        ],
      ),
    );
  }

  FutureBuilder getImage(ComicsProvider comicsProviders, String urlImageCharacter, Size size, String typeGrid) {
    
    return FutureBuilder(
          future:  typeGrid=='characters'?comicsProviders.getOnComicService(urlImageCharacter,'characters')
                  :typeGrid=='teams'?comicsProviders.getOnComicService(urlImageCharacter,'teams')
                  :comicsProviders.getOnComicService(urlImageCharacter,'locations'),
          builder: ( _, AsyncSnapshot snapshot){
            if (snapshot.hasData){
              final  dataCharacters = snapshot.data;
              return ImageAndTitle(data: dataCharacters, size: size);
            }else{
              return Center(child: CupertinoActivityIndicator());
            }
          }
        );
  }
}
 

class ImageAndTitle extends StatelessWidget {
  const ImageAndTitle({
    Key? key,
  
    required this.data,
    required this.size,
  }) : super(key: key);

  final data;
  final Size size;
 

  @override
  Widget build(BuildContext context) {
    final layoutProvider = Provider.of<LayoutProvier>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: FadeInImage(
        placeholder: AssetImage('assets/no-image.jpg'),//loading.gif'),
        image: NetworkImage(layoutProvider.isTablet?data.image!.originalUrl as String:data.image!.thumbUrl as String),
        height: size.height*0.5,
        width: size.width*0.1,
        fit: BoxFit.fill
      ),
    );
  }
}