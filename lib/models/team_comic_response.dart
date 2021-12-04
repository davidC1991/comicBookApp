// To parse this JSON data, do
//
//     final teamComicResponse = teamComicResponseFromMap(jsonString);

import 'dart:convert';

class TeamComicResponse {
    TeamComicResponse({
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
    ResultsTeam? results;
    String? version;

    factory TeamComicResponse.fromJson(String str) => TeamComicResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TeamComicResponse.fromMap(Map<String, dynamic> json) => TeamComicResponse(
        error: json["error"],
        limit: json["limit"],
        offset: json["offset"],
        numberOfPageResults: json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"],
        statusCode: json["status_code"],
        results: ResultsTeam.fromMap(json["results"]),
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

class ResultsTeam {
    ResultsTeam({
        this.aliases,
        this.apiDetailUrl,
        this.characterEnemies,
        this.characterFriends,
        this.characters,
        this.countOfIsssueAppearances,
        this.countOfTeamMembers,
        this.dateAdded,
        this.dateLastUpdated,
        this.deck,
        this.description,
        this.disbandedInIssues,
        this.firstAppearedInIssue,
        this.id,
        this.image,
        this.isssuesDisbandedIn,
        this.issueCredits,
        this.movies,
        this.name,
        this.publisher,
        this.siteDetailUrl,
        this.storyArcCredits,
        this.volumeCredits,
    });

    dynamic aliases;
    String? apiDetailUrl;
    List<dynamic>? characterEnemies;
    List<dynamic>? characterFriends;
    List<FirstAppearedInIssue>? characters;
    int? countOfIsssueAppearances;
    int? countOfTeamMembers;
    DateTime? dateAdded;
    DateTime? dateLastUpdated;
    String? deck;
    String? description;
    List<dynamic>? disbandedInIssues;
    FirstAppearedInIssue? firstAppearedInIssue;
    int? id;
    Image? image;
    List<dynamic>? isssuesDisbandedIn;
    List<FirstAppearedInIssue>? issueCredits;
    List<dynamic>? movies;
    String? name;
    FirstAppearedInIssue? publisher;
    String? siteDetailUrl;
    List<FirstAppearedInIssue>? storyArcCredits;
    List<FirstAppearedInIssue>? volumeCredits;

    factory ResultsTeam.fromJson(String str) => ResultsTeam.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ResultsTeam.fromMap(Map<String, dynamic> json) => ResultsTeam(
        aliases: json["aliases"],
        apiDetailUrl: json["api_detail_url"],
        characterEnemies: List<dynamic>.from(json["character_enemies"].map((x) => x)),
        characterFriends: List<dynamic>.from(json["character_friends"].map((x) => x)),
        characters: List<FirstAppearedInIssue>.from(json["characters"].map((x) => FirstAppearedInIssue.fromMap(x))),
        countOfIsssueAppearances: json["count_of_isssue_appearances"],
        countOfTeamMembers: json["count_of_team_members"],
        dateAdded: DateTime.parse(json["date_added"]),
        dateLastUpdated: DateTime.parse(json["date_last_updated"]),
        deck: json["deck"],
        description: json["description"],
        disbandedInIssues: List<dynamic>.from(json["disbanded_in_issues"].map((x) => x)),
        firstAppearedInIssue: FirstAppearedInIssue.fromMap(json["first_appeared_in_issue"]),
        id: json["id"],
        image: Image.fromMap(json["image"]),
        isssuesDisbandedIn: List<dynamic>.from(json["isssues_disbanded_in"].map((x) => x)),
        issueCredits: List<FirstAppearedInIssue>.from(json["issue_credits"].map((x) => FirstAppearedInIssue.fromMap(x))),
        movies: List<dynamic>.from(json["movies"].map((x) => x)),
        name: json["name"],
        publisher: FirstAppearedInIssue.fromMap(json["publisher"]),
        siteDetailUrl: json["site_detail_url"],
        storyArcCredits: List<FirstAppearedInIssue>.from(json["story_arc_credits"].map((x) => FirstAppearedInIssue.fromMap(x))),
        volumeCredits: List<FirstAppearedInIssue>.from(json["volume_credits"].map((x) => FirstAppearedInIssue.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "aliases": aliases,
        "api_detail_url": apiDetailUrl,
        "character_enemies": List<dynamic>.from(characterEnemies!.map((x) => x)),
        "character_friends": List<dynamic>.from(characterFriends!.map((x) => x)),
        "characters": List<dynamic>.from(characters!.map((x) => x.toMap())),
        "count_of_isssue_appearances": countOfIsssueAppearances,
        "count_of_team_members": countOfTeamMembers,
        "date_added": dateAdded!.toIso8601String(),
        "date_last_updated": dateLastUpdated!.toIso8601String(),
        "deck": deck,
        "description": description,
        "disbanded_in_issues": List<dynamic>.from(disbandedInIssues!.map((x) => x)),
        "first_appeared_in_issue": firstAppearedInIssue!.toMap(),
        "id": id,
        "image": image!.toMap(),
        "isssues_disbanded_in": List<dynamic>.from(isssuesDisbandedIn!.map((x) => x)),
        "issue_credits": List<dynamic>.from(issueCredits!.map((x) => x.toMap())),
        "movies": List<dynamic>.from(movies!.map((x) => x)),
        "name": name,
        "publisher": publisher!.toMap(),
        "site_detail_url": siteDetailUrl,
        "story_arc_credits": List<dynamic>.from(storyArcCredits!.map((x) => x.toMap())),
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
        name: json["name"] == null ? null : json["name"],
        siteDetailUrl: json["site_detail_url"] == null ? null : json["site_detail_url"],
        issueNumber: json["issue_number"] == null ? null : json["issue_number"],
    );

    Map<String, dynamic> toMap() => {
        "api_detail_url": apiDetailUrl,
        "id": id,
        "name": name == null ? null : name,
        "site_detail_url": siteDetailUrl == null ? null : siteDetailUrl,
        "issue_number": issueNumber == null ? null : issueNumber,
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
