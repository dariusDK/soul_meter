import 'dart:convert';

import 'package:flutter/foundation.dart';

class SpotifyUser {
  Me me;
  List<Artist> top_artists;
  List<Track> top_tracks;
  List<Map<String, dynamic>> top_genres;
  SpotifyUser({
    this.me,
    this.top_artists,
    this.top_tracks,
    this.top_genres,
  });
}

class Album {
  final String album_type;
  final List<Map<String, dynamic>> artists;
  final Map<String, String> external_urls;
  final String id;
  final List<SpotifyImage> images;
  final String name;
  final String uri;
  Album({
    this.album_type,
    this.artists,
    this.external_urls,
    this.id,
    this.images,
    this.name,
    this.uri,
  });

  Map<String, dynamic> toMap() {
    return {
      'album_type': album_type,
      'artists': artists,
      'external_urls': external_urls,
      'id': id,
      'images': images?.map((x) => x.toMap())?.toList(),
      'name': name,
      'uri': uri,
    };
  }

  factory Album.fromMap(Map<String, dynamic> map) {
    return Album(
      album_type: map['album_type'],
      artists: List<Map<String, dynamic>>.from(map['artists']?.map((x) => x)),
      external_urls: Map<String, String>.from(map['external_urls']),
      id: map['id'],
      images: List<SpotifyImage>.from(
          map['images']?.map((x) => SpotifyImage.fromMap(x))),
      name: map['name'],
      uri: map['uri'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Album.fromJson(String source) => Album.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Album(album_type: $album_type, artists: $artists, external_urls: $external_urls, id: $id, images: $images, name: $name, uri: $uri)';
  }
}

class Track {
  final int popularity;
  final String preview_url;
  final int track_number;
  final String id;
  final String href;
  final List<Map<String, String>> external_urls;
  final List<Map<String, dynamic>> artists;
  final String name;
  final Album album;
  final String uri;
  Track({
    this.popularity,
    this.preview_url,
    this.track_number,
    this.id,
    this.href,
    this.external_urls,
    this.artists,
    this.name,
    this.album,
    this.uri,
  });

  Map<String, dynamic> toMap() {
    return {
      'popularity': popularity,
      'preview_url': preview_url,
      'track_number': track_number,
      'id': id,
      'href': href,
      'external_urls': external_urls,
      'artists': artists,
      'name': name,
      'album': album.toMap(),
      'uri': uri,
    };
  }

  factory Track.fromMap(Map<String, dynamic> map) {
    return Track(
      popularity: map['popularity'],
      preview_url: map['preview_url'],
      track_number: map['track_number'],
      id: map['id'],
      href: map['href'],
      external_urls: List<Map<String, String>>.from(
          map['external_urls']?.map((x) => x as Map)),
      artists:
          List<Map<String, dynamic>>.from(map['artists']?.map((x) => x as Map)),
      name: map['name'],
      album: Album.fromMap(map['album']),
      uri: map['uri'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Track.fromJson(String source) => Track.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Track(popularity: $popularity, preview_url: $preview_url, track_number: $track_number, id: $id, href: $href, external_urls: $external_urls, artists: $artists, name: $name, album: $album, uri: $uri)';
  }
}

class Artist {
  final Map<String, String> external_urls;
  final int popularity;
  final String type;
  final String uri;
  final List<SpotifyImage> images;
  final String href;
  final String id;
  final Map<String, dynamic> followers;
  final String name;
  final List<String> genres;
  Artist({
    this.external_urls,
    this.popularity,
    this.type,
    this.uri,
    this.images,
    this.href,
    this.id,
    this.followers,
    this.name,
    this.genres,
  });

  Map<String, dynamic> toMap() {
    return {
      'external_urls': external_urls,
      'popularity': popularity,
      'type': type,
      'uri': uri,
      'images': images?.map((x) => x.toMap())?.toList(),
      'href': href,
      'id': id,
      'followers': followers,
      'name': name,
      'genres': genres,
    };
  }

  factory Artist.fromMap(Map<String, dynamic> map) {
    return Artist(
      external_urls: Map<String, String>.from(map['external_urls']),
      popularity: map['popularity'],
      type: map['type'],
      uri: map['uri'],
      images: List<SpotifyImage>.from(
          map['images']?.map((x) => SpotifyImage.fromMap(x))),
      href: map['href'],
      id: map['id'],
      followers: Map<String, dynamic>.from(map['followers']),
      name: map['name'],
      genres: List<String>.from(map['genres']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Artist.fromJson(String source) => Artist.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Artist(external_urls: $external_urls, popularity: $popularity, type: $type, uri: $uri, images: $images, href: $href, id: $id, followers: $followers, name: $name, genres: $genres)';
  }
}

class Me {
  final String country;
  final String display_name;
  final String email;
  final Map<String, String> external_urls;
  final Map<String, dynamic> followers;
  final String href;
  final String id;
  final List<SpotifyImage> images;
  final String product;
  final String type;
  final String uri;
  Me({
    this.country,
    this.display_name,
    this.email,
    this.external_urls,
    this.followers,
    this.href,
    this.id,
    this.images,
    this.product,
    this.type,
    this.uri,
  });

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'display_name': display_name,
      'email': email,
      'external_urls': external_urls,
      'followers': followers,
      'href': href,
      'id': id,
      'images': images?.map((x) => x.toMap())?.toList(),
      'product': product,
      'type': type,
      'uri': uri,
    };
  }

  factory Me.fromMap(Map<String, dynamic> map) {
    return Me(
      country: map['country'],
      display_name: map['display_name'],
      email: map['email'],
      external_urls: Map<String, String>.from(map['external_urls']),
      followers: Map<String, dynamic>.from(map['followers']),
      href: map['href'],
      id: map['id'],
      images: List<SpotifyImage>.from(
          map['images']?.map((x) => SpotifyImage.fromMap(x))),
      product: map['product'],
      type: map['type'],
      uri: map['uri'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Me.fromJson(String source) => Me.fromMap(json.decode(source));
}

class SpotifyImage {
  int height;
  int width;
  String url;
  SpotifyImage({
    this.height,
    this.width,
    this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'height': height,
      'width': width,
      'url': url,
    };
  }

  factory SpotifyImage.fromMap(Map<String, dynamic> map) {
    return SpotifyImage(
      height: map['height'],
      width: map['width'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SpotifyImage.fromJson(String source) =>
      SpotifyImage.fromMap(json.decode(source));

  @override
  String toString() =>
      'SpotifyImage(height: $height, width: $width, url: $url)';
}
