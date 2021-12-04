// To parse this JSON data, do
//
//     final locationComicResponse = locationComicResponseFromMap(jsonString);

import 'dart:convert';

class LocationComicResponse {
    LocationComicResponse({
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
    Results? results;
    String? version;

    factory LocationComicResponse.fromJson(String str) => LocationComicResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LocationComicResponse.fromMap(Map<String, dynamic> json) => LocationComicResponse(
        error: json["error"],
        limit: json["limit"],
        offset: json["offset"],
        numberOfPageResults: json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"],
        statusCode: json["status_code"],
        results: Results.fromMap(json["results"]),
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

class Results {
    Results({
        this.aliases,
        this.apiDetailUrl,
        this.countOfIssueAppearances,
        this.dateAdded,
        this.dateLastUpdated,
        this.deck,
        this.description,
        this.firstAppearedInIssue,
        this.id,
        this.image,
        this.issueCredits,
        this.movies,
        this.name,
        this.siteDetailUrl,
        this.startYear,
        this.storyArcCredits,
        this.volumeCredits,
    });

    dynamic aliases;
    String? apiDetailUrl;
    int? countOfIssueAppearances;
    DateTime? dateAdded;
    DateTime? dateLastUpdated;
    String? deck;
    String? description;
    FirstAppearedInIssue? firstAppearedInIssue;
    int? id;
    Image? image;
    List<FirstAppearedInIssue>? issueCredits;
    List<FirstAppearedInIssue>? movies;
    String? name;
    String? siteDetailUrl;
    String? startYear;
    List<dynamic>? storyArcCredits;
    List<FirstAppearedInIssue>? volumeCredits;

    factory Results.fromJson(String str) => Results.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Results.fromMap(Map<String, dynamic> json) => Results(
        aliases: json["aliases"],
        apiDetailUrl: json["api_detail_url"],
        countOfIssueAppearances: json["count_of_issue_appearances"],
        dateAdded: DateTime.parse(json["date_added"]),
        dateLastUpdated: DateTime.parse(json["date_last_updated"]),
        deck: json["deck"],
        description: json["description"],
        firstAppearedInIssue: FirstAppearedInIssue.fromMap(json["first_appeared_in_issue"]),
        id: json["id"],
        image: Image.fromMap(json["image"]),
        issueCredits: List<FirstAppearedInIssue>.from(json["issue_credits"].map((x) => FirstAppearedInIssue.fromMap(x))),
        movies: List<FirstAppearedInIssue>.from(json["movies"].map((x) => FirstAppearedInIssue.fromMap(x))),
        name: json["name"],
        siteDetailUrl: json["site_detail_url"],
        startYear: json["start_year"],
        storyArcCredits: List<dynamic>.from(json["story_arc_credits"].map((x) => x)),
        volumeCredits: List<FirstAppearedInIssue>.from(json["volume_credits"].map((x) => FirstAppearedInIssue.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "aliases": aliases,
        "api_detail_url": apiDetailUrl,
        "count_of_issue_appearances": countOfIssueAppearances,
        "date_added": dateAdded!.toIso8601String(),
        "date_last_updated": dateLastUpdated!.toIso8601String(),
        "deck": deck,
        "description": description,
        "first_appeared_in_issue": firstAppearedInIssue!.toMap(),
        "id": id,
        "image": image!.toMap(),
        "issue_credits": List<dynamic>.from(issueCredits!.map((x) => x.toMap())),
        "movies": List<dynamic>.from(movies!.map((x) => x.toMap())),
        "name": name,
        "site_detail_url": siteDetailUrl,
        "start_year": startYear,
        "story_arc_credits": List<dynamic>.from(storyArcCredits!.map((x) => x)),
        "volume_credits": List<dynamic>.from(volumeCredits!.map((x) => x.toMap())),
    };
}

class FirstAppearedInIssue {
    FirstAppearedInIssue({
        this.apiDetailUrl,
        this.id,
        this.name,
        this.issueNumber,
        this.siteDetailUrl,
    });

    String? apiDetailUrl;
    int? id;
    String? name;
    String? issueNumber;
    String? siteDetailUrl;

    factory FirstAppearedInIssue.fromJson(String str) => FirstAppearedInIssue.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FirstAppearedInIssue.fromMap(Map<String, dynamic> json) => FirstAppearedInIssue(
        apiDetailUrl: json["api_detail_url"],
        id: json["id"],
        name: json["name"],
        issueNumber: json["issue_number"],
        siteDetailUrl: json["site_detail_url"],
    );

    Map<String, dynamic> toMap() => {
        "api_detail_url": apiDetailUrl,
        "id": id,
        "name": name,
        "issue_number": issueNumber,
        "site_detail_url": siteDetailUrl,
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
