//
//  PosterCardVideoPlayer.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import AVKit
import SwiftUI
import UIKit

/// A SwiftUI wrapper for an AVPlayer-based video player view.
public struct PosterCardVideoPlayer: UIViewRepresentable {
    /// Represents the playback state of a video player.
    public enum Status {
        /// Indicates that the status of the player item is not yet known.
        /// This typically occurs when the player has not attempted to load media resources for playback.
        case unknown

        /// Indicates that the player item is ready to be played.
        case readyToPlay

        /// Indicates that the player item can no longer be played due to an error.
        case failed

        /// Indicates that the video is actively playing.
        case playing

        /// Indicates that the video playback is paused.
        case paused
    }

    /// Configurable parameters for video playback.
    public struct Parameters {
        /// Determines if the video should loop and restart automatically after finishing playback.
        /// If this option is not set, the video stops at the last frame.
        public let loop: Bool

        /// Mutes the video during playback.
        public let muted: Bool

        /// Automatically starts playing the video when loaded.
        /// If set, no overlay with a play button is displayed.
        public let autoplay: Bool

        /// A static image to be displayed while the video is loading. (Optional)
        public let posterImage: Image?

        /// Specifies the aspect ratio of the video. (Optional)
        public let aspectRatio: CGFloat?

        /// Determines how the video content is scaled and aligned within its bounds.
        public let contentMode: ContentMode

        /// Initializes the playback parameters.
        ///
        /// - Parameters:
        ///   - loop: Determines if the video should loop after finishing.
        ///   - muted: Mutes the video during playback.
        ///   - autoplay: Automatically starts playing the video when loaded.
        ///   - posterImage: A static image to display while the video is loading.
        ///   - aspectRatio: The aspect ratio of the video.
        ///   - contentMode: The scaling and alignment mode for the video content.
        public init(
            loop: Bool = true,
            muted: Bool,
            autoplay: Bool,
            posterImage: Image? = nil,
            aspectRatio: CGFloat = 1,
            contentMode: ContentMode = .fill
        ) {
            self.loop = loop
            self.muted = muted
            self.autoplay = autoplay
            self.posterImage = posterImage
            self.aspectRatio = aspectRatio
            self.contentMode = contentMode
        }
    }

    /// The URL of the video to be played.
    public let url: URL

    /// Playback parameters for the video player.
    public let parameters: Parameters

    /// The current playback status of the player.
    @Binding public var playerStatus: Status

    /// The duration of the currently loaded video in seconds.
    @Binding public var playerDuration: Float64

    // MARK: - Initializer

    /// Creates a new instance of `PosterCardVideoPlayer`.
    ///
    /// - Parameters:
    ///   - url: The video URL.
    ///   - parameters: The playback parameters.
    ///   - playerStatus: A binding to the current playback status.
    ///   - playerDuration: A binding to the duration of the video.
    public init(
        url: URL,
        parameters: Parameters,
        playerStatus: Binding<Status>,
        playerDuration: Binding<Float64>
    ) {
        self.url = url
        self.parameters = parameters
        _playerStatus = playerStatus
        _playerDuration = playerDuration
    }

    // MARK: - UIViewRepresentable Methods

    public func makeUIView(context: Context) -> UIView {
        PlayerUIView(
            url: url,
            parameters: parameters,
            playerStatus: $playerStatus,
            playerDuration: $playerDuration
        )
    }

    public func updateUIView(_ uiView: UIView, context: Context) {
        guard let playerView = uiView as? PlayerUIView else { return }
        playerView.updatePlayback(with: playerStatus)
    }
}

/// A UIView subclass that manages an AVPlayer instance for video playback.
/// This class is used to integrate an AVPlayer into a UIView and provides support for
/// customizing playback parameters, reporting status updates, and monitoring video duration.
private class PlayerUIView: UIView {
    /// The AVPlayer instance responsible for video playback.
    private var player: AVPlayer

    /// Configuration parameters for the video player.
    private let parameters: PosterCardVideoPlayer.Parameters

    /// A binding to track the current playback status of the player.
    private var playerStatus: Binding<PosterCardVideoPlayer.Status>

    /// A binding to track the duration of the currently loaded video.
    private var playerDuration: Binding<Float64>

    /// The AVPlayerLayer used to render the video content within the view's bounds.
    private let playerLayer = AVPlayerLayer()

    /// Initializes a new instance of PlayerUIView.
    ///
    /// - Parameters:
    ///   - url: The URL of the video to be played.
    ///   - parameters: Playback parameters for configuring the video player.
    ///   - playerStatus: A binding to track the player's playback status.
    ///   - playerDuration: A binding to track the duration of the video.
    init(
        url: URL,
        parameters: PosterCardVideoPlayer.Parameters,
        playerStatus: Binding<PosterCardVideoPlayer.Status>,
        playerDuration: Binding<Float64>
    ) {
        player = AVPlayer(url: url)
        self.parameters = parameters
        self.playerStatus = playerStatus
        self.playerDuration = playerDuration
        super.init(frame: .zero)

        setupPlayer()
        updatePlayerDuration()
        configurePlayerLayer()
        addEndOfPlaybackObserver()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }

    deinit {
        player.currentItem?.removeObserver(self, forKeyPath: "status")
    }
}

// MARK: - Private Extensions

private extension PlayerUIView {
    /// Configures the AVPlayer with initial parameters.
    func setupPlayer() {
        player.isMuted = parameters.muted
        player.currentItem?.addObserver(self, forKeyPath: "status", options: [.new, .initial], context: nil)
    }

    /// Updates the duration of the current video.
    func updatePlayerDuration() {
        if let currentItem = player.currentItem {
            DispatchQueue.main.async { [weak self] in
                self?.playerDuration.wrappedValue = CMTimeGetSeconds(currentItem.asset.duration)
            }
        }
    }

    /// Updates the playback state based on the provided player status.
    ///
    /// - Parameter playerStatus: The desired playback status.
    func updatePlayback(with playerStatus: PosterCardVideoPlayer.Status) {
        guard let currentItem = player.currentItem else { return }
        switch playerStatus {
        case .playing:
            if currentItem.duration.seconds == currentItem.currentTime().seconds {
                player.seek(to: .zero)
            }
            player.play()
        default:
            player.pause()
        }
    }

    /// Configures the player layer for video rendering.
    func configurePlayerLayer() {
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
    }

    /// Adds an observer for detecting when playback reaches the end.
    func addEndOfPlaybackObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(playerItemDidReachEnd),
            name: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem
        )
    }

    /// Handles playback completion events.
    @objc func playerItemDidReachEnd() {
        if playerStatus.wrappedValue == .playing, parameters.loop {
            player.seek(to: .zero)
            player.play()
        } else {
            playerStatus.wrappedValue = .readyToPlay
        }
    }

    /// Observes changes to the player's item status and updates the playback status accordingly.
    override func observeValue(
        forKeyPath keyPath: String?,
        of object: Any?,
        change: [NSKeyValueChangeKey: Any]?,
        context: UnsafeMutableRawPointer?
    ) {
        guard keyPath == "status", let item = object as? AVPlayerItem else { return }
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if item.status == .failed {
                self.playerStatus.wrappedValue = .failed
            } else if item.status == .readyToPlay {
                self.playerStatus.wrappedValue = .readyToPlay
            }
        }
    }
}
