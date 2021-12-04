import 'package:comic_book_app/services/warning_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:comic_book_app/services/layout_provider.dart';
import 'package:comic_book_app/services/filter_provider.dart';
import 'package:comic_book_app/services/comic_provider.dart';
import 'package:comic_book_app/services/mode_presentation_provider.dart';

import 'package:comic_book_app/widgets/widgets.dart';
// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  bool checkAscendingFilter = false;
  bool stateConnection = false;
  @override
  Widget build(BuildContext context) {

    // ignore: non_constant_identifier_names
    final comicsProviders = Provider.of<ComicsProvider>(context);
    final modePresentationProviders = Provider.of<ModePresentation>(context, listen: true);
    final filterProvider  = Provider.of<FilterProvider>(context);
    final warningProvider  = Provider.of<WarningProvider>(context, listen: false);
    final layoutProvider  = Provider.of<LayoutProvier>(context, listen: false);
   
    final size = MediaQuery.of(context).size;
    return OrientationBuilder (
        builder: ( BuildContext context, Orientation orientation){
           if( size.width > 500){
              WidgetsBinding.instance!.addPostFrameCallback((_){
                print('mode tablet');
                layoutProvider.stateScreenIsTable = true;
              });
          
          }else{
              WidgetsBinding.instance!.addPostFrameCallback((_){
                print('mode phone');
                layoutProvider.stateScreenIsTable = false;
              });
          }
           
           
           return FutureBuilder(
             future: warningProvider.checkInternetState(),
             builder: (BuildContext context, AsyncSnapshot snapshot) {
                print(snapshot.data);
               if (snapshot.hasData){
                  stateConnection = snapshot.data;
                  return stateConnection?homePage(context, filterProvider, size, comicsProviders, modePresentationProviders,layoutProvider)
                        :Scaffold(body: Center(child: Text('NO CONNECTION AVAILABLE', style:  Theme.of(context).textTheme.headline3)));
               }else{
                 return Scaffold(body: Center(child: Text('NO CONNECTION AVAILABLE', style:  Theme.of(context).textTheme.headline3)));
               }
             },
           ); 
             
        });
  }

 
  Scaffold homePage(BuildContext context, FilterProvider filterProvider, Size size, ComicsProvider comicsProviders, ModePresentation modePresentationProviders, LayoutProvier layoutProvider) {
     
    return Scaffold(
    appBar: AppBar(
      title: Center(child: Text('Comic Books', style: Theme.of(context).textTheme.headline3)),
      actions:[
        IconButton(
          onPressed: ()=> filterProvider.pressFilter(true),
          icon:  Icon(Icons.filter_list_outlined, size: 25, color: Colors.grey)
        )
      ]
    ),
    body: comicsProviders.onDisplayComics.isEmpty?Center(child: CupertinoActivityIndicator(radius:layoutProvider.isTablet?30:10,))
          :SingleChildScrollView(
          child: Column(
            children: [
              filterProvider.isPressedFilter?filterContainer(size, filterProvider,context,comicsProviders):Container(),
              subtitle(size,context,modePresentationProviders),
              Divider(),
              modePresentationProviders.isGrid?GridMode(comics : comicsProviders.onDisplayComics)
              :ListMode(comics : comicsProviders.onDisplayComics)
            ],
          ),
        )
      );
      }

  Container filterContainer(Size size, FilterProvider filterProvider, BuildContext context, ComicsProvider comicsProviders) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final layoutProvider = Provider.of<LayoutProvier>(context, listen: true);
    return Container(
      width:  size.width*0.9,
      height: layoutProvider.isTablet?size.height*0.4:size.height*0.18,
      child:   Column(
        children: [

            Divider(),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                   mainAxisAlignment: layoutProvider.isTablet?MainAxisAlignment.center:MainAxisAlignment.start,
                  children: [
                    Text('Filter by order: ', style: textTheme.headline1, overflow: TextOverflow.ellipsis, maxLines: 1),
                    checkBoxModel(filterProvider,'asc'),
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Text('Ascending', style: textTheme.headline1, overflow: TextOverflow.ellipsis, maxLines: 1),
                    ),
                    checkBoxModel(filterProvider,'desc'),
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Text('Descending', style: textTheme.headline1, overflow: TextOverflow.ellipsis, maxLines: 1),
                    ),
                  ],),
              ),
            ),
            //Divider(),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: layoutProvider.isTablet?MainAxisAlignment.center:MainAxisAlignment.start,
                  children: [
                    Text('Filter by date: ', style: textTheme.headline1, overflow: TextOverflow.ellipsis, maxLines: 1),
                    Padding(
                      padding: const EdgeInsets.only(left:4.0),
                      child: checkBoxModel(filterProvider,'dateAdded'),
                    ),
                    Text('dateAdded', style: textTheme.headline1, overflow: TextOverflow.ellipsis, maxLines: 5),
                    checkBoxModel(filterProvider,'dateUpdated'),
                    Text('dateUpdated', style: textTheme.headline1, overflow: TextOverflow.ellipsis, maxLines: 5),
                  ],),
              ),
            ),
             Expanded(
               flex: 2,
               child: ButtonBar(
                 buttonHeight: size.height*0.06,
                 alignment: MainAxisAlignment.center,
                 children: [
                   ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       primary: Colors.blue[400]
                     ),
                     onPressed: (){
                       comicsProviders.getOnDisplayComics(isAscending:filterProvider.ascending,isDateUpdate: filterProvider.lastDateUpdated);
                       filterProvider.pressFilter(false);
                     },
                     child: Text('Apply')
                   ),
                   ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[400],
                     ),
                     onPressed: ()=>filterProvider.pressFilter(false),
                     child: Text('Cancel')
                   ),
                 ],
               ),
             ),
        ],
      )
    );
  }
                     

  Checkbox checkBoxModel(FilterProvider filterProvider, String typeFilter) {
    return Checkbox(
                value: typeFilter=='asc'?filterProvider.ascending
                      :typeFilter=='desc'?filterProvider.descending
                      :typeFilter=='dateAdded'?filterProvider.lastDateAdded
                      :filterProvider.lastDateUpdated, 
                onChanged: (bool? value){
                 
                  filterProvider.setStateFilter(value!, typeFilter);
                },
          );
  }
            
            
            

  // ignore: non_constant_identifier_names
  ListTile subtitle(Size size, BuildContext context, final modePresentationProviders) {
    // ignore: non_constant_identifier_names
    
    return ListTile(
            visualDensity: VisualDensity.compact,
            leading: Text('Latest Issues', style: Theme.of(context).textTheme.headline1),
            trailing: Container(
              
              width: size.width*0.37,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[
                  IconButton(
                    onPressed: (){
                      modePresentationProviders.setModePresentation(false);
                    },
                    icon: Icon(Icons.list_outlined, color: modePresentationProviders.isGrid?Colors.green[800]:Colors.black87)
                  ),
                  Text('List', style: Theme.of(context).textTheme.headline1),
                  IconButton(
                    onPressed: (){
                      modePresentationProviders.setModePresentation(true);
                    },
                    icon: Icon(Icons.grid_on_rounded, color: modePresentationProviders.isGrid?Colors.black87:Colors.green[800])
                  ),
                  Text('Grid', style: Theme.of(context).textTheme.headline1),
                ]
              ),
            ),
          );
  }

 


  

}