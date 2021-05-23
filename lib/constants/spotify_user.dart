class SpotifyUser {
  final Map<String, dynamic> me;
  final List<dynamic> topArtistsSortedByPopularity;
  final List<dynamic> topTracksSortedByPopularity;
  final List<dynamic> topAGenresSortedByPopularity;

  SpotifyUser(this.me, this.topArtistsSortedByPopularity,
      this.topTracksSortedByPopularity, this.topAGenresSortedByPopularity);
}
