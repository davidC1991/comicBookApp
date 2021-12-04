// To parse this JSON data, do
//
//     final nowComicResponse = nowComicResponseFromMap(jsonString);

import 'dart:convert';

class NowComicResponse {
    NowComicResponse({
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
    List<Result>? results;
    String? version;

    factory NowComicResponse.fromJson(String str) => NowComicResponse.fromMap(json.decode(str));

 

    factory NowComicResponse.fromMap(Map<String, dynamic> json) => NowComicResponse(
        error  : json["error"],
        limit  : json["limit"],
        offset : json["offset"],
        numberOfPageResults  : json["number_of_page_results"],
        numberOfTotalResults : json["number_of_total_results"],
        statusCode           : json["status_code"],
        results              : List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
        version              : json["version"],
    );

    Map<String, dynamic> toMap() => {
        "error"    : error,
        "limit"    : limit,
        "offset"   : offset,
        "number_of_page_results"  : numberOfPageResults,
        "number_of_total_results" : numberOfTotalResults,
        "status_code"             : statusCode,
        "results"                 : List<dynamic>.from(results!.map((x) => x.toMap())),
        "version"                 : version,
    };
}

class Result {
    Result({
        this.aliases,
        this.apiDetailUrl,
        this.coverDate,
        this.dateAdded,
        this.dateLastUpdated,
        this.deck,
        this.description,
        this.hasStaffReview,
        this.id,
        this.image,
        this.issueNumber,
        this.name,
        this.siteDetailUrl,
        this.storeDate,
        this.volume,
    });

    dynamic aliases;
    String? apiDetailUrl;
    String? coverDate;
    DateTime? dateAdded;
    DateTime? dateLastUpdated;
    dynamic deck;
    String? description;
    bool? hasStaffReview;
    int? id;
    Image? image;
    String? issueNumber;
    String? name;
    String? siteDetailUrl;
    String? storeDate;
    Volume? volume;

    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        aliases      : json["aliases"],
        apiDetailUrl : json["api_detail_url"],
        coverDate    : json["cover_date"],
        dateAdded    : DateTime.parse(json["date_added"]),
        dateLastUpdated : DateTime.parse(json["date_last_updated"]),
        deck            : json["deck"],
        description     : json["description"],
        hasStaffReview  : json["has_staff_review"],
        id              : json["id"],
        image           : Image.fromMap(json["image"]),
        issueNumber     : json["issue_number"],
        name            : json["name"],
        siteDetailUrl   : json["site_detail_url"],
        storeDate       : json["store_date"],
        volume          : Volume.fromMap(json["volume"]),
    );

    Map<String, dynamic> toMap() => {
        "aliases"        : aliases,
        "api_detail_url" : apiDetailUrl,
        "cover_date"     : coverDate,
        "date_added"     : dateAdded!.toIso8601String(),
        "date_last_updated" : dateLastUpdated!.toIso8601String(),
        "deck"              : deck,
        "description"       : description,
        "has_staff_review"  : hasStaffReview,
        "id"                : id,
        "image"             : image!.toMap(),
        "issue_number"      : issueNumber,
        "name"              : name ,
        "site_detail_url"   : siteDetailUrl,
        "store_date"        : storeDate,
        "volume"            : volume!.toMap(),
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
    ImageTags? imageTags;

    factory Image.fromJson(String str) => Image.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Image.fromMap(Map<String, dynamic> json) => Image(
        iconUrl   : json["icon_url"],
        mediumUrl : json["medium_url"],
        screenUrl : json["screen_url"],
        screenLargeUrl : json["screen_large_url"],
        smallUrl       : json["small_url"],
        superUrl       : json["super_url"],
        thumbUrl       : json["thumb_url"],
        tinyUrl        : json["tiny_url"],
        originalUrl    : json["original_url"],
        imageTags      : imageTagsValues.map[json["image_tags"]],
    );

    Map<String, dynamic> toMap() => {
        "icon_url"   : iconUrl,
        "medium_url" : mediumUrl,
        "screen_url" : screenUrl,
        "screen_large_url" : screenLargeUrl,
        "small_url"        : smallUrl,
        "super_url"        : superUrl,
        "thumb_url"        : thumbUrl,
        "tiny_url"         : tinyUrl,
        "original_url"     : originalUrl,
        "image_tags"       : imageTagsValues.reverse![imageTags],
    };
}

enum ImageTags { ALL_IMAGES }

final imageTagsValues = EnumValues({
    "All Images": ImageTags.ALL_IMAGES
});

class Volume {
    Volume({
        this.apiDetailUrl,
        this.id,
        this.name,
        this.siteDetailUrl,
    });

    String? apiDetailUrl;
    int? id;
    String? name;
    String? siteDetailUrl;

    factory Volume.fromJson(String str) => Volume.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Volume.fromMap(Map<String, dynamic> json) => Volume(
        apiDetailUrl  : json["api_detail_url"],
        id            : json["id"],
        name          : json["name"],
        siteDetailUrl : json["site_detail_url"],
    );

    Map<String, dynamic> toMap() => {
        "api_detail_url"  : apiDetailUrl,
        "id"              : id,
        "name"            : name,
        "site_detail_url" : siteDetailUrl,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
