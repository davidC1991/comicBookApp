// To parse this JSON data, do
//
//    To get the characters, names and pitures

import 'dart:convert';

class CharacterComicResponse {
    CharacterComicResponse({
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
    ResultCharacter? results;
    String? version;

    factory CharacterComicResponse.fromJson(String str) => CharacterComicResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CharacterComicResponse.fromMap(Map<String, dynamic> json) => CharacterComicResponse(
        error: json["error"],
        limit: json["limit"],
        offset: json["offset"],
        numberOfPageResults: json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"],
        statusCode: json["status_code"],
        results: ResultCharacter.fromMap(json["results"]),
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

class ResultCharacter {
    ResultCharacter({
        this.aliases,
        this.apiDetailUrl,
        this.birth,
        this.characterEnemies,
        this.characterFriends,
        this.countOfIssueAppearances,
        this.creators,
        this.dateAdded,
        this.dateLastUpdated,
        this.deck,
        this.description,
        this.firstAppearedInIssue,
        this.gender,
        this.id,
        this.image,
        this.issueCredits,
        this.issuesDiedIn,
        this.movies,
        this.name,
        this.origin,
        this.powers,
        this.publisher,
        this.realName,
        this.siteDetailUrl,
        this.storyArcCredits,
        this.teamEnemies,
        this.teamFriends,
        this.teams,
        this.volumeCredits,
    });

    String? aliases;
    String? apiDetailUrl;
    dynamic birth;
    List<FirstAppearedInIssue>? characterEnemies;
    List<FirstAppearedInIssue>? characterFriends;
    int? countOfIssueAppearances;
    List<FirstAppearedInIssue>? creators;
    DateTime? dateAdded;
    DateTime? dateLastUpdated;
    String? deck;
    String? description;
    FirstAppearedInIssue? firstAppearedInIssue;
    int? gender;
    int? id;
    Image? image;
    List<FirstAppearedInIssue>? issueCredits;
    List<dynamic>? issuesDiedIn;
    List<dynamic>? movies;
    String? name;
    FirstAppearedInIssue? origin;
    List<FirstAppearedInIssue>? powers;
    FirstAppearedInIssue? publisher;
    String? realName;
    String? siteDetailUrl;
    List<dynamic>? storyArcCredits;
    List<dynamic>? teamEnemies;
    List<dynamic>? teamFriends;
    List<dynamic>? teams;
    List<FirstAppearedInIssue>? volumeCredits;

    factory ResultCharacter.fromJson(String str) => ResultCharacter.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ResultCharacter.fromMap(Map<String, dynamic> json) => ResultCharacter(
        aliases: json["aliases"],
        apiDetailUrl: json["api_detail_url"],
        birth: json["birth"],
        characterEnemies: List<FirstAppearedInIssue>.from(json["character_enemies"].map((x) => FirstAppearedInIssue.fromMap(x))),
        characterFriends: List<FirstAppearedInIssue>.from(json["character_friends"].map((x) => FirstAppearedInIssue.fromMap(x))),
        countOfIssueAppearances: json["count_of_issue_appearances"],
        creators: List<FirstAppearedInIssue>.from(json["creators"].map((x) => FirstAppearedInIssue.fromMap(x))),
        dateAdded: DateTime.parse(json["date_added"]),
        dateLastUpdated: DateTime.parse(json["date_last_updated"]),
        deck: json["deck"],
        description: json["description"],
        firstAppearedInIssue: FirstAppearedInIssue.fromMap(json["first_appeared_in_issue"]),
        gender: json["gender"],
        id: json["id"],
        image: Image.fromMap(json["image"]),
        issueCredits: List<FirstAppearedInIssue>.from(json["issue_credits"].map((x) => FirstAppearedInIssue.fromMap(x))),
        issuesDiedIn: List<dynamic>.from(json["issues_died_in"].map((x) => x)),
        movies: List<dynamic>.from(json["movies"].map((x) => x)),
        name: json["name"],
        origin: FirstAppearedInIssue.fromMap(json["origin"]),
        powers: List<FirstAppearedInIssue>.from(json["powers"].map((x) => FirstAppearedInIssue.fromMap(x))),
        publisher: FirstAppearedInIssue.fromMap(json["publisher"]),
        realName: json["real_name"],
        siteDetailUrl: json["site_detail_url"],
        storyArcCredits: List<dynamic>.from(json["story_arc_credits"].map((x) => x)),
        teamEnemies: List<dynamic>.from(json["team_enemies"].map((x) => x)),
        teamFriends: List<dynamic>.from(json["team_friends"].map((x) => x)),
        teams: List<dynamic>.from(json["teams"].map((x) => x)),
        volumeCredits: List<FirstAppearedInIssue>.from(json["volume_credits"].map((x) => FirstAppearedInIssue.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "aliases": aliases,
        "api_detail_url": apiDetailUrl,
        "birth": birth,
        "character_enemies": List<dynamic>.from(characterEnemies!.map((x) => x.toMap())),
        "character_friends": List<dynamic>.from(characterFriends!.map((x) => x.toMap())),
        "count_of_issue_appearances": countOfIssueAppearances,
        "creators": List<dynamic>.from(creators!.map((x) => x.toMap())),
        "date_added": dateAdded!.toIso8601String(),
        "date_last_updated": dateLastUpdated!.toIso8601String(),
        "deck": deck,
        "description": description,
        "first_appeared_in_issue": firstAppearedInIssue!.toMap(),
        "gender": gender,
        "id": id,
        "image": image!.toMap(),
        "issue_credits": List<dynamic>.from(issueCredits!.map((x) => x.toMap())),
        "issues_died_in": List<dynamic>.from(issuesDiedIn!.map((x) => x)),
        "movies": List<dynamic>.from(movies!.map((x) => x)),
        "name": name,
        "origin": origin!.toMap(),
        "powers": List<dynamic>.from(powers!.map((x) => x.toMap())),
        "publisher": publisher!.toMap(),
        "real_name": realName,
        "site_detail_url": siteDetailUrl,
        "story_arc_credits": List<dynamic>.from(storyArcCredits!.map((x) => x)),
        "team_enemies": List<dynamic>.from(teamEnemies!.map((x) => x)),
        "team_friends": List<dynamic>.from(teamFriends!.map((x) => x)),
        "teams": List<dynamic>.from(teams!.map((x) => x)),
        "volume_credits": List<dynamic>.from(volumeCredits!.map((x) => x.toMap())),
    };
}

class FirstAppearedInIssue {
    FirstAppearedInIssue({
        this.apiDetailUrl,
        this.id,
        this.name,
        this.siteDetailUrl,
        this.issueNumber,
    });

    String? apiDetailUrl;
    int? id;
    String? name;
    String? siteDetailUrl;
    String? issueNumber;

    factory FirstAppearedInIssue.fromJson(String str) => FirstAppearedInIssue.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FirstAppearedInIssue.fromMap(Map<String, dynamic> json) => FirstAppearedInIssue(
        apiDetailUrl: json["api_detail_url"],
        id: json["id"],
        name: json["name"] ,
        siteDetailUrl: json["site_detail_url"] ,
        issueNumber: json["issue_number"] ,
    );

    Map<String, dynamic> toMap() => {
        "api_detail_url": apiDetailUrl,
        "id": id,
        "name": name,
        "site_detail_url": siteDetailUrl ,
        "issue_number": issueNumber,
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

    String? iconUrl;
    String? mediumUrl;
    String? screenUrl;
    String? screenLargeUrl;
    String? smallUrl;
    String? superUrl;
    String? thumbUrl;
    String? tinyUrl;
    String? originalUrl;
    String? imageTags;

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
