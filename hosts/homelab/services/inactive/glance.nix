# This does not work without making passwords/apis cleartext. Setting up secrets has proved way too difficult. So this is disabled until then. 

{ configs, pkgs, secrets, ... }:
{
  services.glance = {
    enable = true;
    settings = {
      server = {
        host = "0.0.0.0";
        port = 1918;
      };

      theme = {
        background-color = "50 1 6";
        primary-color = "24 97 58";
        negative-color = "209 88 54";
      };

      auth = {
        secret-key = secrets.glance_key;
        users.erik.password = secrets.glance_pass;
      };

      pages = [
        {
          name = "Home";

          columns = [
            
            {
              size = "small";
              widgets = [
                {
                  type = "calendar";
                }
                {
                  type = "weather";
                  location = "Provo, Utah, United States";
                  units = "imperial";
                }
              ];
            }

            {
              size = "full";
              widgets = [
                {
                  type = "monitor";
                  cache = "2m";
                  title = "Services";
                  sites = [
                    {
                      title = "Jellyfin";
                      url = "https://media.eleedee.net";
                      icon = "sh:jellyfin";
                    }
                    {
                      title = "AdGuard";
                      url = "https://ad.eleedee.net";
                      icon = "sh:adguard-home";
                    }
                    {
                      title = "CopyParty";
                      url = "https://files.eleedee.net";
                      icon = "sh:copyparty";
                    }
                    {
                      title = "Glance";
                      url = "https://homelab.eleedee.net";
                      icon = "sh:glance";
                    }
                  ];
                }
                {
                  type = "server-stats";
                  servers = [ 
                    {
                      type = "local";
                      name = "Services";
                    }
                  ];
                }
                {
                  type = "dns-stats";
                  service = "adguard";
                  url = "https://ad.eleedee.net";
                  username = "erik";
                  password = secrets.adguard_pass;
                }
              ];
            }

            {
              size = "small";
              widgets = [
                {
                  type = "clock";
                }
                {
                  type = "hacker-news";
                }
                {
                  type = "custom-api";
                  title = "Jellyfin Server Status";
                  cache =  "5m";
                  options = {
                    media-server = "jellyfin";
                    base-url = "https://media.eleedee.net";
                    api-key = secrets.jellyfin_api;
                    small-column = true;
                    compact = false;
                    play-state = "indicator";
                    show-thumbnail = false;
                    full-thumbnail = false;
                    show-paused = false;
                    show-progress-bar = false;
                    show-progress-info = true;
                    time-format = "03:04";
                  };
                  template = ''
                    {{ $mediaServer := .Options.StringOr "media-server" "" }}
                    {{ $baseURL := .Options.StringOr "base-url" "" }}
                    {{ $apiKey := .Options.StringOr "api-key" "" }}

                    {{ define "errorMsg" }}
                      <div class="widget-error-header">
                        <div class="color-negative size-h3">ERROR</div>
                        <svg class="widget-error-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126ZM12 15.75h.007v.008H12v-.008Z"></path>
                        </svg>
                      </div>
                      <p class="break-all">{{ . }}</p>
                    {{ end }}

                    {{ if or
                      (eq $mediaServer "")
                      (eq $baseURL "")
                      (eq $apiKey "")
                    }}
                      {{ template "errorMsg" "Some required options are not set" }}
                    {{ else }}

                    {{ $isSmallColumn := .Options.BoolOr "small-column" false }}
                    {{ $isCompact := .Options.BoolOr "compact" true }}
                    {{ $playState := .Options.StringOr "play-state" "indicator" }}
                    {{ $showThumbnail := .Options.BoolOr "show-thumbnail" false }}
                    {{ $fullThumbnail := .Options.BoolOr "full-thumbnail" false }}
                    {{ $showPaused := .Options.BoolOr "show-paused" false }}
                    {{ $showProgressBar := .Options.BoolOr "show-progress-bar" false }}
                    {{ $showProgressInfo := .Options.BoolOr "show-progress-info" true }}
                    {{ $timeFormat := .Options.StringOr "time-format" "15:04" }}

                    {{ $userID := "" }}
                    {{ $sessionsRequestURL := "" }}
                    {{ $sessionsCall := "" }}
                    {{ $sessions := "" }}
                    {{ $activeSessions := 0 }}

                    {{ if eq $mediaServer "plex" }}
                      {{ $sessionsRequestURL = concat $baseURL "/status/sessions" }}
                      {{ $sessionsCall = newRequest $sessionsRequestURL
                        | withHeader "Accept" "application/json"
                        | withHeader "X-Plex-Token" $apiKey
                        | getResponse }}

                      {{ if $sessionsCall.JSON.Exists "MediaContainer" }}
                        {{ $sessions = $sessionsCall.JSON.Array "MediaContainer.Metadata" }}
                        {{ $activeSessions = len $sessions }}
                      {{ else }}
                        {{ template "errorMsg" (concat "Could not fetch " $mediaServer " API.") }}
                      {{ end }}

                    {{ else if eq $mediaServer "tautulli" }}
                      {{ $sessionsRequestURL = concat $baseURL "/api/v2" }}
                      {{ $sessionsCall = newRequest $sessionsRequestURL
                        | withParameter "apikey" $apiKey
                        | withParameter "cmd" "get_activity"
                        | withHeader "Accept" "application/json"
                        | getResponse }}

                      {{ if eq $sessionsCall.Response.StatusCode 200 }}
                        {{ $sessions = $sessionsCall.JSON.Array "response.data.sessions" }}
                        {{ $activeSessions = len $sessions }}
                      {{ else }}
                        {{ template "errorMsg" (concat "Could not fetch " $mediaServer " API.") }}
                      {{ end }}

                    {{ else if or (eq $mediaServer "jellyfin") (eq $mediaServer "emby") }}
                      {{ $sessionsRequestURL = concat $baseURL "/Sessions" }}
                      {{ $sessionsCall = newRequest $sessionsRequestURL
                        | withParameter "api_key" $apiKey
                        | withParameter "activeWithinSeconds" "30"
                        | withHeader "Accept" "application/json"
                        | getResponse }}

                      {{ if eq $sessionsCall.Response.StatusCode 200 }}
                        {{ $sessions = $sessionsCall.JSON.Array "" }}
                        {{ if eq $mediaServer "emby" }}
                          {{ range $session := $sessions }}
                            {{ if $session.Bool "PlayState.CanSeek" }}
                              {{ $activeSessions = 1 }}
                              {{ break }}
                            {{ end }}
                          {{ end }}
                        {{ else }}
                          {{ $activeSessions = len $sessions }}
                        {{ end }}
                      {{ else }}
                        {{ template "errorMsg" (concat "Could not fetch " $mediaServer " API.") }}
                      {{ end }}
                    {{ end }}

                    {{ if and (eq $sessionsCall.Response.StatusCode 200) (eq $activeSessions 0) }}
                      <p>Nothing is playing right now.</p>
                    {{ else }}

                      <style>
                        .media-server-session-container--grid {
                          display: grid;
                          grid-template-columns: repeat(2, 1fr);
                        }
                        @media (max-width: 768px) {
                          .media-server-session-container--grid {
                            display: flex;
                            flex-direction: column;
                          }
                        }
                        .media-server-progress-container {
                          height: 1rem;
                          max-width: 32rem;
                          border: 1px solid var(--color-text-base);
                          border-radius: var(--border-radius);
                          overflow: hidden;
                        }
                        .media-server-progress-bar {
                          height: 100%;
                          background: var(--color-primary);
                          border-radius: 3px;
                          transition: width 1s linear;
                        }
                        @keyframes progress-animation { to { width: 100%; } }
                      </style>

                      <div class="gap-10 {{ if $isSmallColumn }}flex flex-column{{ else }}media-server-session-container--grid{{ end }}">
                      {{ range $i, $session := $sessions }}
                        {{ $isClient := true }}
                        {{ $isPlaying := false }}
                        {{ $state := "playing" }}
                        {{ $isMovie := false }}
                        {{ $isShows := false }}
                        {{ $isMusic := false }}
                        {{ $userName := "" }}
                        {{ $title := "" }}
                        {{ $showTitle := "" }}
                        {{ $showSeason := "" }}
                        {{ $showEpisode := "" }}
                        {{ $artist := "" }}
                        {{ $albumTitle := "" }}
                        {{ $thumbURL := "" }}
                        {{ $now := now | formatTime "15:04:05" | parseLocalTime "15:04:05" }}
                        {{ $duration := 0 }}
                        {{ $offset := 0 }}
                        {{ $remainingSeconds := 0 }}

                        {{ if eq $mediaServer "plex" }}
                          {{ $isPlaying = eq ($session.String "Player.state") "playing" }}
                          {{ if not $isPlaying }}
                            {{ $state = "paused"}}
                          {{ end }}

                          {{ $mediaType := $session.String "type" }}
                          {{ $isMovie = eq $mediaType "movie" }}
                          {{ $isShows = eq $mediaType "episode" }}
                          {{ $isMusic = eq $mediaType "track" }}

                          {{ $userName = $session.String "User.title" }}
                          {{ $title = $session.String "title" }}
                          {{ $showTitle = $session.String "grandparentTitle" }}
                          {{ $showSeason = $session.String "parentIndex" }}
                          {{ $showEpisode = $session.String "index" }}
                          {{ $artist = $session.String "grandparentTitle" }}
                          {{ $albumTitle = $session.String "parentTitle" }}

                          {{ $thumbID := $session.String "thumb" }}
                          {{ if or $isShows $isMusic }}
                            {{ $thumbID = $session.String "parentThumb" }}
                          {{ end }}
                          {{ $thumbURL = concat $baseURL $thumbID "?X-Plex-Token=" $apiKey }}

                          {{ $duration = $session.Float "duration" }}
                          {{ $offset = $session.Float "viewOffset" }}
                          {{ $remainingSeconds = div (sub $duration $offset) 1000 | toInt }}
                        {{ else if eq $mediaServer "tautulli" }}
                          {{ $isPlaying = eq ($session.String "state") "playing" }}
                          {{ if not $isPlaying }}
                            {{ $state = "paused"}}
                          {{ end }}

                          {{ $mediaType := $session.String "media_type" }}
                          {{ $isMovie = eq $mediaType "movie" }}
                          {{ $isShows = eq $mediaType "episode" }}
                          {{ $isMusic = eq $mediaType "track" }}

                          {{ $userName = $session.String "user" }}
                          {{ $title = $session.String "title" }}
                          {{ $showTitle = $session.String "grandparent_title" }}
                          {{ $showSeason = $session.String "parent_media_index" }}
                          {{ $showEpisode = $session.String "media_index" }}
                          {{ $artist = $session.String "grandparent_title" }}
                          {{ $albumTitle = $session.String "parent_title" }}

                          {{ $thumbID := $session.String "thumb" }}
                          {{ if or $isShows $isMusic }}
                            {{ $thumbID = $session.String "parent_thumb" }}
                          {{ end }}
                          {{ $thumbURL = concat $baseURL "/api/v2?apikey=" $apiKey "&cmd=pms_image_proxy&img=" $thumbID }}

                          {{ $duration = $session.Float "duration" }}
                          {{ $offset = $session.Float "view_offset" }}
                          {{ $remainingSeconds = div (sub $duration $offset) 1000 | toInt }}
                        {{ else if or (eq $mediaServer "jellyfin") (eq $mediaServer "emby") }}
                          {{ if eq $mediaServer "emby" }}
                            {{ $isClient = $session.Bool "PlayState.CanSeek" }}
                          {{ end }}
                          {{ $isPlaying = and ($session.Exists "NowPlayingItem") (not ($session.Bool "PlayState.IsPaused")) }}
                          {{ if not $isPlaying }}
                            {{ $state = "paused"}}
                          {{ end }}

                          {{ $mediaType := $session.String "NowPlayingItem.Type" }}
                          {{ $isMovie = eq $mediaType "Movie" }}
                          {{ $isShows = eq $mediaType "Episode" }}
                          {{ $isMusic = eq $mediaType "Audio" }}

                          {{ $userName = $session.String "UserName" }}
                          {{ $title = $session.String "NowPlayingItem.Name" }}
                          {{ $showTitle = $session.String "NowPlayingItem.SeriesName" }}
                          {{ $showSeason = $session.String "NowPlayingItem.ParentIndexNumber" }}
                          {{ $showEpisode = $session.String "NowPlayingItem.IndexNumber" }}
                          {{ $artist = $session.String "NowPlayingItem.AlbumArtist" }}
                          {{ $albumTitle = $session.String "NowPlayingItem.Album" }}

                          {{ $thumbID := $session.String "NowPlayingItem.Id" }}
                          {{ if $isShows }}
                            {{ $thumbID = $session.String "NowPlayingItem.ParentId" }}
                          {{ end }}
                          {{ $thumbURL = concat $baseURL "/Items/" $thumbID "/Images/Primary?api_key=" $apiKey }}

                          {{ $duration = $session.Float "NowPlayingItem.RunTimeTicks" }}
                          {{ $offset = $session.Float "PlayState.PositionTicks" }}
                          {{ $remainingSeconds = div (sub $duration $offset) 10000000 | toInt }}
                        {{ end }}

                        {{ $progress := mul 100 (div $offset $duration) | toInt }}
                        {{ $endTime := $now.Add (duration (printf "%ds" $remainingSeconds)) | formatTime $timeFormat }}

                        {{ $showInfoFormat := concat "Season " $showSeason " Episode " $showEpisode}}
                        {{ if $isCompact }}
                          {{ $showInfoFormat = concat "S" $showSeason "E" $showEpisode}}
                        {{ end }}

                        {{ if and $isClient (or $isPlaying $showPaused) }}
                        <div class="card gap-5">
                          <div class="flex items-center gap-10 size-h3">
                            <span class="color-primary">{{ $userName }}</span>
                            {{ if eq $playState "text" }}
                              <span {{ if $isPlaying }}class="color-primary"{{ end }}>
                                [{{ $state }}]
                              </span>
                            {{ else if eq $playState "indicator" }}
                              <style>
                                .media-server-indicator {
                                  height: .7rem;
                                  width: .7rem;
                                  border-radius: 100%;
                                  {{ if $isPlaying }}
                                    animation: pulse 5s infinite;
                                    background: var(--color-primary);
                                  {{ else }}
                                    background: var(--color-text-base-muted);
                                  {{ end }}
                                }
                                @keyframes pulse {
                                  0% { box-shadow: 0 0 0 0 var(--color-text-base); }
                                  40% { box-shadow: 0 0 0 4px transparent; }
                                  100% { box-shadow: 0 0 0 4px transparent; }
                                }
                              </style>
                              <div class="media-server-indicator"></div>
                            {{ end }}
                          </div>

                          <hr class="margin-bottom-5" />

                          <div class="flex items-center gap-10" style="align-items: stretch;">
                            {{ if $showThumbnail }}
                              <img src="{{ $thumbURL | safeURL }}"
                                alt="{{ $title }} thumbnail"
                                class="shrink-0"
                                loading="lazy"
                                style="
                                  max-width: 7.5rem;
                                  border: 2px solid var(--color-primary);
                                  border-radius: var(--border-radius);
                                  object-fit: cover;
                                  {{ if and $isCompact (not $fullThumbnail) }} aspect-ratio: 1; {{ end }} "
                              />
                            {{ end }}
                            <ul class="flex flex-column grow justify-evenly" style="width: 0;">
                              {{ if $isCompact }}
                                {{ if $isShows }}
                                  <ul class="list-horizontal-text flex-nowrap">
                                    <li class="shrink-0">{{ concat "S" $showSeason "E" $showEpisode }}</li>
                                    <li class="text-truncate">{{ $showTitle }}</li>
                                  </ul>
                                {{ else if $isMusic }}
                                  <ul class="list-horizontal-text flex-nowrap">
                                    <li class="shrink-0">{{ $artist }}</li>
                                    <li class="text-truncate">{{ $albumTitle }}</li>
                                  </ul>
                                {{ end }}
                                <li class="text-truncate">{{ $title }}</li>
                              {{ else }}
                                {{ if $isShows }}
                                  <li>{{ $showTitle }}</li>
                                  <li>{{ concat "S" $showSeason "E" $showEpisode }}</li>
                                {{ else if $isMusic }}
                                  <li>{{ $artist }}</li>
                                  <li>{{ $albumTitle }}</li>
                                {{ end }}
                                <li>{{ $title }}</li>
                              {{ end }}

                              <li>
                                {{ if and $isPlaying $showProgressBar }}
                                  <div class="flex gap-10 items-center">
                                    <div class="media-server-progress-container grow">
                                      <div
                                        class ="media-server-progress-bar"
                                        data-progress="{{ $progress }}"
                                        data-remaining="{{ $remainingSeconds }}"
                                        style="
                                          width: {{ $progress }}%;
                                          animation: progress-animation {{ $remainingSeconds }}s linear forwards;"
                                      >
                                      </div>
                                    </div>
                                    {{ if $showProgressInfo }}
                                      <p>
                                        {{ if and (not $isCompact) (not $isSmallColumn) }}
                                          ends at 
                                        {{ end }}
                                        {{ $endTime }}
                                      </p>
                                    {{ end }}
                                  </div>
                                {{ end }}
                              </li>
                            </ul>
                          </div>
                        </div>
                        {{ end }}
                      {{ end }}
                    </div>
                    {{ end }}
                    {{ end }}
                  '';
                }
              ];
            }
          ];
        }
      ];
    };
  };

  networking.firewall.allowedTCPPorts = [ 1918 ];
}
