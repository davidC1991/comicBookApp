// To parse this JSON data, do
//
//     final detailsComicResponse = detailsComicResponseFromMap(jsonString);

import 'dart:convert';

class DetailsComicResponse {
    DetailsComicResponse({
        this.error,
        this.limit,
        this.offset,
        this.numberOfPageResults,
        this.numberOfTotalResults,
        this.statusCode,
        this.results,
        this.version,
    });

    String? error;
    int? limit;
    int? offset;
    int? numberOfPageResults;
    int? numberOfTotalResults;
    int? statusCode;
    ResultDetails? results;
    String? version;

    factory DetailsComicResponse.fromJson(String str) => DetailsComicResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DetailsComicResponse.fromMap(Map<String, dynamic> json) => DetailsComicResponse(
        error: json["error"],
        limit: json["limit"],
        offset: json["offset"],
        numberOfPageResults: json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"],
        statusCode: json["status_code"],
        results: ResultDetails.fromMap(json["results"]),
        version: json["version"],
    );

    Map<String, dynamic> toMap() => {
        "error": error,
        "limit": limit,
        "offset": offset,
        "number_of_page_results": numberOfPageResults,
        "number_of_total_results": numberOfTotalResults,
        "status_code": statusCode,
        "results": results!.toMap(),
        "version": version,
    };
}

class ResultDetails {
    ResultDetails({
        this.aliases,
        this.apiDetailUrl,
        this.characterCredits,
        this.characterDiedIn,
        this.conceptCredits,
        this.coverDate,
        this.dateAdded,
        this.dateLastUpdated,
        this.deck,
        this.description,
        this.firstAppearanceCharacters,
        this.firstAppearanceConcepts,
        this.firstAppearanceLocations,
        this.firstAppearanceObjects,
        this.firstAppearanceStoryarcs,
        this.firstAppearanceTeams,
        this.hasStaffReview,
        this.id,
        this.image,
        this.issueNumber,
        this.locationCredits,
        this.name,
        this.objectCredits,
        this.personCredits,
        this.siteDetailUrl,
        this.storeDate,
        this.storyArcCredits,
        this.teamCredits,
        this.teamDisbandedIn,
        this.volume,
    });

    dynamic       aliases;
    String        ?apiDetailUrl;
    List<Volume>  ?characterCredits;
    List<dynamic> ?characterDiedIn;
    List<dynamic> ?conceptCredits;
    DateTime      ?coverDate;
    DateTime      ?dateAdded;
    DateTime      ?dateLastUpdated;
    dynamic       deck;
    String        ?description;
    dynamic       firstAppearanceCharacters;
    dynamic       firstAppearanceConcepts;
    dynamic       firstAppearanceLocations;
    dynamic       firstAppearanceObjects;
    dynamic       firstAppearanceStoryarcs;
    dynamic       firstAppearanceTeams;
    bool          ?hasStaffReview;
    int           ?id;
    Image         ?image;
    String        ?issueNumber;
    List<dynamic> ?locationCredits;
    dynamic       name;
    List<dynamic> ?objectCredits;
    List<Volume>  ?personCredits;
    String        ?siteDetailUrl;
    dynamic       storeDate;
    List<dynamic> ?storyArcCredits;
    List<Volume>  ?teamCredits;
    List<dynamic> ?teamDisbandedIn;
    Volume        ?volume;

    factory ResultDetails.fromJson(String str) => ResultDetails.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ResultDetails.fromMap(Map<String, dynamic> json) => ResultDetails(
        aliases: json["aliases"],
        apiDetailUrl: json["api_detail_url"],
        characterCredits: List<Volume>.from(json["character_credits"].map((x) => Volume.fromMap(x))),
        characterDiedIn: List<dynamic>.from(json["character_died_in"].map((x) => x)),
        conceptCredits: List<dynamic>.from(json["concept_credits"].map((x) => x)),
        coverDate: DateTime.parse(json["cover_date"]),
        dateAdded: DateTime.parse(json["date_added"]),
        dateLastUpdated: DateTime.parse(json["date_last_updated"]),
        deck: json["deck"],
        description: json["description"],
        firstAppearanceCharacters: json["first_appearance_characters"],
        firstAppearanceConcepts: json["first_appearance_concepts"],
        firstAppearanceLocations: json["first_appearance_locations"],
        firstAppearanceObjects: json["first_appearance_objects"],
        firstAppearanceStoryarcs: json["first_appearance_storyarcs"],
        firstAppearanceTeams: json["first_appearance_teams"],
        hasStaffReview: json["has_staff_review"],
        id: json["id"],
        image: Image.fromMap(json["image"]),
        issueNumber: json["issue_number"],
        locationCredits: List<VolumeCredits>.from(json["location_credits"].map((x) => VolumeCredits.fromMap(x))),
        name: json["name"],
        objectCredits: List<dynamic>.from(json["object_credits"].map((x) => x)),
        personCredits: List<Volume>.from(json["person_credits"].map((x) => Volume.fromMap(x))),
        siteDetailUrl: json["site_detail_url"],
        storeDate: json["store_date"],
        storyArcCredits: List<dynamic>.from(json["story_arc_credits"].map((x) => x)),
        teamCredits: List<Volume>.from(json["team_credits"].map((x) => Volume.fromMap(x))),
        teamDisbandedIn: List<dynamic>.from(json["team_disbanded_in"].map((x) => x)),
        volume: Volume.fromMap(json["volume"]),
    );

    Map<String, dynamic> toMap() => {
        "aliases": aliases,
        "api_detail_url": apiDetailUrl,
        "character_credits": List<dynamic>.from(characterCredits!.map((x) => x.toMap())),
        "character_died_in": List<dynamic>.from(characterDiedIn!.map((x) => x)),
        "concept_credits": List<dynamic>.from(conceptCredits!.map((x) => x)),
        "cover_date": "${coverDate!.year.toString().padLeft(4, '0')}-${coverDate!.month.toString().padLeft(2, '0')}-${coverDate!.day.toString().padLeft(2, '0')}",
        "date_added": dateAdded!.toIso8601String(),
        "date_last_updated": dateLastUpdated!.toIso8601String(),
        "deck": deck,
        "description": description,
        "first_appearance_characters": firstAppearanceCharacters,
        "first_appearance_concepts": firstAppearanceConcepts,
        "first_appearance_locations": firstAppearanceLocations,
        "first_appearance_objects": firstAppearanceObjects,
        "first_appearance_storyarcs": firstAppearanceStoryarcs,
        "first_appearance_teams": firstAppearanceTeams,
        "has_staff_review": hasStaffReview,
        "id": id,
        "image": image!.toMap(),
        "issue_number": issueNumber,
        "location_credits": List<dynamic>.from(locationCredits!.map((x) => x)),
        "name": name,
        "object_credits": List<dynamic>.from(objectCredits!.map((x) => x)),
        "person_credits": List<dynamic>.from(personCredits!.map((x) => x.toMap())),
        "site_detail_url": siteDetailUrl,
        "store_date": storeDate,
        "story_arc_credits": List<dynamic>.from(storyArcCredits!.map((x) => x)),
        "team_credits": List<dynamic>.from(teamCredits!.map((x) => x.toMap())),
        "team_disbanded_in": List<dynamic>.from(teamDisbandedIn!.map((x) => x)),
        "volume": volume!.toMap(),
    };
}

class VolumeCredits {
    VolumeCredits({
        this.apiDetailUrl,
        this.id,
        this.name,
       
    });

    String ?apiDetailUrl;
    int    ?id;
    String ?name;
   

    factory VolumeCredits.fromJson(String str) => VolumeCredits.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory VolumeCredits.fromMap(Map<String, dynamic> json) => VolumeCredits(
        apiDetailUrl: json["api_detail_url"],
        id: json["id"],
        name: json["name"],
       
    );

    Map<String, dynamic> toMap() => {
        "api_detail_url": apiDetailUrl,
        "id": id,
        "name": name,
    };
}

class Volume {
    Volume({
        this.apiDetailUrl,
        this.id,
        this.name,
        this.siteDetailUrl,
        this.role,
    });

    String ?apiDetailUrl;
    int    ?id;
    String ?name;
    String ?siteDetailUrl;
    String ?role;

    factory Volume.fromJson(String str) => Volume.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Volume.fromMap(Map<String, dynamic> json) => Volume(
        apiDetailUrl: json["api_detail_url"],
        id: json["id"],
        name: json["name"],
        siteDetailUrl: json["site_detail_url"],
        role: json["role"] ,
    );

    Map<String, dynamic> toMap() => {
        "api_detail_url": apiDetailUrl,
        "id": id,
        "name": name,
        "site_detail_url": siteDetailUrl,
        "role": role ,
    };
}

class Image {
    Image({
        this.iconUrl,
        this.mediumUrl,
        this.screenUrl,
        this.screenLargeUrl,
        this.smallUrl,
        this.superUrl,
        this.thumbUrl,
        this.tinyUrl,
        this.originalUrl,
        this.imageTags,
    });

    String ?iconUrl;
    String ?mediumUrl;
    String ?screenUrl;
    String ?screenLargeUrl;
    String ?smallUrl;
    String ?superUrl;
    String ?thumbUrl;
    String ?tinyUrl;
    String ?originalUrl;
    String ?imageTags;

    factory Image.fromJson(String str) => Image.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Image.fromMap(Map<String, dynamic> json) => Image(
        iconUrl: json["icon_url"],
        mediumUrl: json["medium_url"],
        screenUrl: json["screen_url"],
        screenLargeUrl: json["screen_large_url"],
        smallUrl: json["small_url"],
        superUrl: json["super_url"],
        thumbUrl: json["thumb_url"],
        tinyUrl: json["tiny_url"],
        originalUrl: json["original_url"],
        imageTags: json["image_tags"],
    );

    Map<String, dynamic> toMap() => {
        "icon_url": iconUrl,
        "medium_url": mediumUrl,
        "screen_url": screenUrl,
        "screen_large_url": screenLargeUrl,
        "small_url": smallUrl,
        "super_url": superUrl,
        "thumb_url": thumbUrl,
        "tiny_url": tinyUrl,
        "original_url": originalUrl,
        "image_tags": imageTags,
    };
}

// // To parse this JSON data, do
// //
// //     final detailsComicResponse = detailsComicResponseFromMap(jsonString);

// import 'dart:convert';

// class DetailsComicResponse {
//     DetailsComicResponse({
//         this.error,
//         this.limit,
//         this.offset,
//         this.numberOfPageResults,
//         this.numberOfTotalResults,
//         this.statusCode,
//         this.results,
//         this.version,
//     });

//     String? error;
//     int? limit;
//     int? offset;
//     int? numberOfPageResults;
//     int? numberOfTotalResults;
//     int? statusCode;
//     ResultDetails? results;
//     String? version;

//     factory DetailsComicResponse.fromJson(String str) => DetailsComicResponse.fromMap(json.decode(str));

   

//     factory DetailsComicResponse.fromMap(Map<String, dynamic> json) => DetailsComicResponse(
//         error: json["error"],
//         limit: json["limit"],
//         offset: json["offset"],
//         numberOfPageResults: json["number_of_page_results"],
//         numberOfTotalResults: json["number_of_total_results"],
//         statusCode: json["status_code"],
//         results: ResultDetails.fromMap(json["results"]),
//         version: json["version"],
//     );

  
// }

// class ResultDetails {
//     ResultDetails({
//         this.aliases,
//         required this.apiDetailUrl,
//         required this.characterCredits,
//         required this.characterDiedIn,
//         required this.conceptCredits,
//         this.coverDate,
//         required this.dateAdded,
//         required this.dateLastUpdated,
//         required this.deck,
//         this.description,
//         required this.firstAppearanceCharacters,
//         required this.firstAppearanceConcepts,
//         required this.firstAppearanceLocations,
//         required this.firstAppearanceObjects,
//         required this.firstAppearanceStoryarcs,
//         required this.firstAppearanceTeams,
//         required this.hasStaffReview,
//         required this.id,
//         required this.image,
//         required this.issueNumber,
//         required this.locationCredits,
//         this.name,
//         required this.objectCredits,
//         required this.personCredits,
//         required this.siteDetailUrl,
//         required this.storeDate,
//         required this.storyArcCredits,
//         required this.teamCredits,
//         required this.teamDisbandedIn,
//         required this.volume,
//     });

//     dynamic aliases;
//     String apiDetailUrl;
//     List<Volume> characterCredits;
//     List<dynamic> characterDiedIn;
//     List<Volume> conceptCredits;
//     String? coverDate;
//     DateTime dateAdded;
//     DateTime dateLastUpdated;
//     dynamic deck;
//     String? description;
//     dynamic firstAppearanceCharacters;
//     dynamic firstAppearanceConcepts;
//     dynamic firstAppearanceLocations;
//     dynamic firstAppearanceObjects;
//     dynamic firstAppearanceStoryarcs;
//     dynamic firstAppearanceTeams;
//     bool hasStaffReview;
//     int id;
//     Image image;
//     String issueNumber;
//     List<Volume> locationCredits;
//     String? name;
//     List<dynamic> objectCredits;
//     List<Volume> personCredits;
//     String siteDetailUrl;
//     dynamic storeDate;
//     List<dynamic> storyArcCredits;
//     List<dynamic> teamCredits;
//     List<dynamic> teamDisbandedIn;
//     Volume volume;

//     factory ResultDetails.fromJson(String str) => ResultDetails.fromMap(json.decode(str));

  

//     factory ResultDetails.fromMap(Map<String, dynamic> json) => ResultDetails(
//         aliases: json["aliases"],
//         apiDetailUrl: json["api_detail_url"],
//         characterCredits: List<Volume>.from(json["character_credits"].map((x) => Volume.fromMap(x))),
//         characterDiedIn: List<dynamic>.from(json["character_died_in"].map((x) => x)),
//         conceptCredits: List<Volume>.from(json["concept_credits"].map((x) => Volume.fromMap(x))),
//         coverDate: json["cover_date"],
//         dateAdded: DateTime.parse(json["date_added"]),
//         dateLastUpdated: DateTime.parse(json["date_last_updated"]),
//         deck: json["deck"],
//         description: json["description"],
//         firstAppearanceCharacters: json["first_appearance_characters"],
//         firstAppearanceConcepts: json["first_appearance_concepts"],
//         firstAppearanceLocations: json["first_appearance_locations"],
//         firstAppearanceObjects: json["first_appearance_objects"],
//         firstAppearanceStoryarcs: json["first_appearance_storyarcs"],
//         firstAppearanceTeams: json["first_appearance_teams"],
//         hasStaffReview: json["has_staff_review"],
//         id: json["id"],
//         image: Image.fromMap(json["image"]),
//         issueNumber: json["issue_number"],
//         locationCredits: List<Volume>.from(json["location_credits"].map((x) => Volume.fromMap(x))),
//         name: json["name"],
//         objectCredits: List<dynamic>.from(json["object_credits"].map((x) => x)),
//         personCredits: List<Volume>.from(json["person_credits"].map((x) => Volume.fromMap(x))),
//         siteDetailUrl: json["site_detail_url"],
//         storeDate: json["store_date"],
//         storyArcCredits: List<dynamic>.from(json["story_arc_credits"].map((x) => x)),
//         teamCredits: List<dynamic>.from(json["team_credits"].map((x) => x)),
//         teamDisbandedIn: List<dynamic>.from(json["team_disbanded_in"].map((x) => x)),
//         volume: Volume.fromMap(json["volume"]),
//     );

   
// }

// class Volume {
//     Volume({
//         required this.apiDetailUrl,
//         required this.id,
//         required this.name,
//         required this.siteDetailUrl,
//         this.role,
//     });

//     String apiDetailUrl;
//     int id;
//     String name;
//     String siteDetailUrl;
//     String? role;

//     factory Volume.fromJson(String str) => Volume.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Volume.fromMap(Map<String, dynamic> json) => Volume(
//         apiDetailUrl: json["api_detail_url"],
//         id: json["id"],
//         name: json["name"],
//         siteDetailUrl: json["site_detail_url"],
//         role: json["role"] == null ? null : json["role"],
//     );

//     Map<String, dynamic> toMap() => {
//         "api_detail_url": apiDetailUrl,
//         "id": id,
//         "name": name,
//         "site_detail_url": siteDetailUrl,
//         "role": role ,
//     };
// }

// class Image {
//     Image({
//         required this.iconUrl,
//         required this.mediumUrl,
//         required this.screenUrl,
//         required this.screenLargeUrl,
//         required this.smallUrl,
//         required this.superUrl,
//         required this.thumbUrl,
//         required this.tinyUrl,
//         required this.originalUrl,
//         required this.imageTags,
//     });

//     String iconUrl;
//     String mediumUrl;
//     String screenUrl;
//     String screenLargeUrl;
//     String smallUrl;
//     String superUrl;
//     String thumbUrl;
//     String tinyUrl;
//     String originalUrl;
//     String imageTags;

//     factory Image.fromJson(String str) => Image.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Image.fromMap(Map<String, dynamic> json) => Image(
//         iconUrl: json["icon_url"],
//         mediumUrl: json["medium_url"],
//         screenUrl: json["screen_url"],
//         screenLargeUrl: json["screen_large_url"],
//         smallUrl: json["small_url"],
//         superUrl: json["super_url"],
//         thumbUrl: json["thumb_url"],
//         tinyUrl: json["tiny_url"],
//         originalUrl: json["original_url"],
//         imageTags: json["image_tags"],
//     );

//     Map<String, dynamic> toMap() => {
//         "icon_url": iconUrl,
//         "medium_url": mediumUrl,
//         "screen_url": screenUrl,
//         "screen_large_url": screenLargeUrl,
//         "small_url": smallUrl,
//         "super_url": superUrl,
//         "thumb_url": thumbUrl,
//         "tiny_url": tinyUrl,
//         "original_url": originalUrl,
//         "image_tags": imageTags,
//     };
// }
