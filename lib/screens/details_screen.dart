

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:comic_book_app/services/layout_provider.dart';
import 'package:comic_book_app/services/filter_provider.dart';
import 'package:comic_book_app/services/warning_provider.dart';


import 'package:comic_book_app/services/comic_provider.dart';
import 'package:comic_book_app/widgets/widgets.dart';
import 'package:comic_book_app/models/details_comic_response.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  
  bool flag       = true;
  int cont        = 0;
  
 
  @override
  Widget build(BuildContext context) {
    
    final detailUrl       = ModalRoute.of(context)!.settings.arguments as String;
    final comicsProviders = Provider.of<ComicsProvider>(context, listen: false);
    final layoutProvider  = Provider.of<LayoutProvier>(context, listen: false);
    final filterProvider  = Provider.of<FilterProvider>(context);
    final warningProvider = Provider.of<WarningProvider>(context);
    final size            = MediaQuery.of(context).size;
    
    return Scaffold(
      
      body: FutureBuilder(
        future: comicsProviders.getOnComicService(detailUrl,'comic'),//comicsProviders.getOnDisplayDetailsComic(detailUrl),
        builder: ( _, AsyncSnapshot snapshot){
          print(snapshot.data);
          if ( snapshot.hasData){
            ResultDetails dataComic = snapshot.data;
            flag = false;
            if (layoutProvider.isTablet){
              return screenDetailsTablet(context, filterProvider, size, comicsProviders, dataComic, layoutProvider);
            }else{
              return  screenDetailsPhone(dataComic);
            }    
          }else{ 
              //SET UP A ALGORITH TO ENSURE THAT AFTER A TIME LOADING IT SHOW A MESSAGE SAYING EMPTY RESPONSE OR NO DATA
              if ( snapshot.data == null){
               cont ++;
               if (cont == 2){ 
                 cont = 0;
                 WidgetsBinding.instance!.addPostFrameCallback((_){
                    warningProvider.setResponseEmpty(true);
                 });
               }
              }

              if (warningProvider.responseEmpty){
                return Center(child: Text('NO DATA AVAILABLE', style:  Theme.of(context).textTheme.headline3));    
              }else{
                return Center(child: CupertinoActivityIndicator());
              }
 
          }
        }
      )
    );
  }
             

  CustomScrollView screenDetailsPhone(ResultDetails dataComic) {
    return CustomScrollView(
            physics: ScrollPhysics(),
            slivers: [
              _CustomAppBar(),
              SliverList(
                delegate: SliverChildListDelegate([
                  GridDetails(columns: 4, dataComic: dataComic)
                ])
              )
            ],
          );
  }

  Scaffold screenDetailsTablet(BuildContext context, FilterProvider filterProvider, Size size, ComicsProvider comicsProviders, ResultDetails dataComic, LayoutProvier layoutProvider) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text('Comic Books', style: Theme.of(context).textTheme.headline3)),
          actions:[
            layoutProvider.isTablet?Container():IconButton(
              onPressed: ()=> filterProvider.pressFilter(true),
              icon:  Icon(Icons.filter_list_outlined, size: 25, color: Colors.grey)
            )
          ]
        ),
      body:  Row(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          width: size.width*0.5,
          child:  SingleChildScrollView(child: GridDetails(columns: 4, dataComic: dataComic)),
        ),
        
        Expanded(
          child: Container(
            width: size.width*0.5,
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(comicsProviders.onDetailComic.image!.thumbUrl as String),
              width: size.width*0.23,
              height:size.height*0.9,
              fit: BoxFit.fill
            ),
          ),
        )
      ],
      ) ,  
    );
  }
}

      
class _CustomAppBar extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final comicsProviders = Provider.of<ComicsProvider>(context);
    return SliverAppBar(
      backgroundColor:  Colors.grey[300],
      expandedHeight:400,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(''),
        centerTitle: true,
        background: FadeInImage(
          placeholder: AssetImage('assets/no-image.jpg'),//loading.gif'),
          image: NetworkImage(comicsProviders.onDetailComic.image!.originalUrl as String),
          fit: BoxFit.fill
        ),
      ),
    );
  }
}

