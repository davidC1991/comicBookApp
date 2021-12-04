

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:comic_book_app/services/warning_provider.dart';
import 'package:comic_book_app/services/layout_provider.dart';
import 'package:comic_book_app/models/now_comic_response.dart';



const Map<int,String> months = {
   1: 'January',    
   2: 'February',    
   3: 'March',    
   4: 'April',   
   5: 'May',    
   6: 'June',    
   7: 'July',    
   8: 'August',    
   9: 'September',    
   10: 'October',   
   11: 'November',    
   12: 'December'    
};


class GridMode extends StatelessWidget {
 final List<Result> comics;
  
  const GridMode({required this.comics});
  

  @override
  Widget build(BuildContext context) {
  final layoutProvider = Provider.of<LayoutProvier>(context);
  
    return GridView.builder(
        //reverse: true,
        itemCount: comics.length,//comics.length,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 1.0,
          childAspectRatio: 1.0,
          mainAxisExtent: layoutProvider.isTablet?300:250
        ),
        itemBuilder: (BuildContext context, int i){
          //print(comics[i].apiDetailUrl);
          return comicimage(comics[i],context,layoutProvider);
        },);
  }
  

  
  Widget comicimage(Result comic, BuildContext context, final layoutProvider){
    final size = MediaQuery.of(context).size;
    final warningProvider = Provider.of<WarningProvider>(context, listen: false);
    
    String? month = months[comic.dateAdded!.month.toInt()];
    String day   = comic.dateAdded!.day.toString();
    String date  = month!+' ' + (day.length == 1 ? '0' + day : day ) +', ' + comic.dateAdded!.year.toString();
    return Container(
      width: size.width*0.25,
      height: layoutProvider.isTablet?size.height*0.4:size.height*0.15,
      child: Column(
        crossAxisAlignment : CrossAxisAlignment.center,
        mainAxisAlignment  : MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                warningProvider.setResponseEmpty(false);
                
                Navigator.pushNamed(context, 'details', arguments: comic.apiDetailUrl);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage(
                  placeholder: AssetImage('assets/loading.gif'),
                  image: NetworkImage(layoutProvider.isTablet?comic.image!.originalUrl as String:comic.image!.thumbUrl as String),
                  width: layoutProvider.isTablet?size.width*0.2:size.width*0.23,
                  height:layoutProvider.isTablet?size.height*0.56:size.height*0.19,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(height: size.height*0.01),
          comic.name!=null?
                Expanded(
                  flex:1,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text( comic.name! +' #'+comic.issueNumber! ,maxLines: 2, style: Theme.of(context).textTheme.headline1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center)
                      ),
                      Text( date, style: Theme.of(context).textTheme.headline2,maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,)
                    ],
                  )
                ):Expanded(
                  flex:1,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text('Not Name', style: Theme.of(context).textTheme.headline1, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center)
                      ),
                      Text( date, style: Theme.of(context).textTheme.headline2,maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,)
                    ],
                  )
                ),
         
               
                
        ],
      ),
    );
  }
}
                  