import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:comic_book_app/models/now_comic_response.dart';

import 'package:comic_book_app/services/layout_provider.dart';

import 'package:comic_book_app/widgets/widgets.dart';

class ListMode extends StatelessWidget {
 
  final List<Result> comics;

  const ListMode({required this.comics});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount:this.comics.length,
      itemBuilder: (BuildContext context, int i) => listComics(this.comics[i],size,context)
    );
  }

  Widget listComics(Result comic, final size, BuildContext context){
    final layoutProvider = Provider.of<LayoutProvier>(context, listen: true);
    String? month = months[comic.dateAdded!.month.toInt()];
    String day   = comic.dateAdded!.day.toString();
    String date  = month!+' ' + (day.length == 1 ? '0' + day : day ) +', ' + comic.dateAdded!.year.toString();
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(1),
      height: layoutProvider.isTablet?size.height*0.6
              :size.height*0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: comic.apiDetailUrl),
            child: FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage(layoutProvider.isTablet?comic.image!.originalUrl as String:comic.image!.thumbUrl as String),
              width: layoutProvider.isTablet?size.width*0.2:size.width*0.23,
              height:layoutProvider.isTablet?size.height*0.56:size.height*0.19,
              fit: BoxFit.fill
            ),
          ),
          Container(
           
            width: size.width*0.66,
            height: layoutProvider.isTablet?size.height*0.56:size.height*0.2,
            child:  Column(
              children:[ comic.name!=null?
                Text( comic.name! +' #'+comic.issueNumber! ,maxLines: 2, style: Theme.of(context).textTheme.headline1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,)
                :Text('Not Name', style: Theme.of(context).textTheme.headline1, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,),
                 Text( date , style: Theme.of(context).textTheme.headline2,maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,)
              ]
            ),
          )
        ],
      ),
    );
  }
}

