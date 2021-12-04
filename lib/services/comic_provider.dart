import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import 'package:comic_book_app/models/now_comic_response.dart';
import 'package:comic_book_app/models/character_comic_response.dart';
import 'package:comic_book_app/models/details_comic_response.dart';
import 'package:comic_book_app/models/location_comic_response.dart';
import 'package:comic_book_app/models/team_comic_response.dart';


class ComicsProvider extends ChangeNotifier{
  
  String _apiKey  = 'd8568dd08d7374dad5d22a8ceb13af9927ff8d09';
  String _baseUrl = 'comicvine.gamespot.com';
  String _format  = 'json';
  String _sort    = 'date_last_updated:desc';
  List<Result> onDisplayComics = [];
  late ResultDetails   onDetailComic;
  late ResultCharacter onCharacterComic;
  late ResultsTeam     onTeamsComic;

  ComicsProvider(){
    print('MoviesPorvider starting');

    this.getOnDisplayComics();
  }

  getOnDisplayComics({bool isAscending=false,bool isDateUpdate=true})async{
    
    if (isAscending && isDateUpdate){
      _sort = 'date_last_updated:asc';
    }else if(!isAscending && isDateUpdate){
      _sort = 'date_last_updated:desc';
    }else if(isAscending && !isDateUpdate){
      _sort = 'date_added:asc';
    }else if(!isAscending && !isDateUpdate){
      _sort = 'date_added:desc';
    }
    Map<String,String>? headers = {
         // "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
};
    var url = Uri.https(_baseUrl, 'api/issues', {
      'api_key' : _apiKey,
      'format'  : _format,
      'sort'    : _sort
    });

  // Await the http get response, then decode the json-formatted response.
    final response   = await http.get(url,headers:headers);
    final nowComicResponse = NowComicResponse.fromJson(response.body);
    
    onDisplayComics = nowComicResponse.results!;//.sort((a,b) => a.dateAdded.compareTo(b.dateAdded)); 
    notifyListeners();
  }

  Future getOnComicService(String detailUrl,String typeGrid)async{
      print(detailUrl);
      String detailUrlPath = detailUrl.substring(31,); 
      detailUrlPath = detailUrlPath.substring(0,detailUrlPath.length-1);

      var url = Uri.https(_baseUrl, detailUrlPath, {
        'api_key' : _apiKey,
        'format'  : _format,
        
      });
       
    // Await the http get response, then decode the json-formatted response.
      final response   = await http.get(url);
      print(response.statusCode);
      if(typeGrid == 'comic'){   //to get data of a specific comic
         final detailsComicResponse = DetailsComicResponse.fromJson(response.body);
         onDetailComic = detailsComicResponse.results!;//.sort((a,b) => a.dateAdded.compareTo(b.dateAdded)); 
         return onDetailComic;
      }else if(typeGrid == 'characters'){  //to get data characters from a specific comic
        final characterComicResponse = CharacterComicResponse.fromJson(response.body);
         onCharacterComic = characterComicResponse.results!;
         return onCharacterComic;
      }else if(typeGrid == 'teams'){
         final teamsComicResponse = TeamComicResponse.fromJson(response.body);
         onTeamsComic = teamsComicResponse.results!;
         return onTeamsComic;
      }else if(typeGrid == 'locations'){
         final locationsComicResponse = LocationComicResponse.fromJson(response.body);
         return locationsComicResponse.results!;
      }else if(typeGrid == 'concepts'){
         final locationsComicResponse = TeamComicResponse.fromJson(response.body);
         return locationsComicResponse.results!;
      }

  }


  // //   Future<ResultDetails>getOnDisplayDetailsComic(String detailUrl)async{
     
  // //     String detailUrlPath = detailUrl.substring(31,); 
  // //     detailUrlPath = detailUrlPath.substring(0,detailUrlPath.length-1);

  // //     var url = Uri.https(_baseUrl, detailUrlPath, {
  // //       'api_key' : _apiKey,
  // //       'format'  : _format
  // //     });

  // //   // Await the http get response, then decode the json-formatted response.
  // //     final response   = await http.get(url);
  // //     final detailsComicResponse = DetailsComicResponse.fromJson(response.body);
  // //     onDetailComic = detailsComicResponse.results!;//.sort((a,b) => a.dateAdded.compareTo(b.dateAdded)); 
      
  // //     return onDetailComic;
  // // }

  //  Future<ResultCharacter>getOnDisplayCharacterComic(String detailUrlChracter)async{
     
  //     String detailUrlChracterPath = detailUrlChracter.substring(31,); 
  //     detailUrlChracterPath = detailUrlChracterPath.substring(0,detailUrlChracterPath.length-1);
  //     //print(detailUrlChracterPath);
  //     var url = Uri.https(_baseUrl, detailUrlChracterPath, {
  //       'api_key' : _apiKey,
  //       'format'  : _format
  //     });

  //   // Await the http get response, then decode the json-formatted response.
  //     final response   = await http.get(url);
  //     //print(response.body);
  //     final characterComicResponse = CharacterComicResponse.fromJson(response.body);
     
     
  //     onCharacterComic = characterComicResponse.results!;
      
  //     return onCharacterComic;
  // }
   
}

