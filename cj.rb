# frozen_string_literal: true

class Cj < Formula
  desc "Installer for cj's development environment using a Brewfile"
  homepage "https://github.com/0xC4J/homebrew-0xc4j"
  url "https://github.com/0xC4J/homebrew-0xc4j/archive/refs/tags/v7.0.0.tar.gz"
  sha256 "a4253a0a22df5f619c5e8630d6840a9c3da90b295a19669d79607aca97c6ef31"
  license "MIT"

  def install
    brewfile_url = "https://raw.githubusercontent.com/0xC4J/homebrew-0xc4j/main/Brewfile"
    
    ohai "Downloading Brewfile from your GitHub..."
    system "curl", "-fsSL", "-o", buildpath/"Brewfile.downloaded", brewfile_url

    unless File.exist?(buildpath/"Brewfile.downloaded")
      odie "Failed to download Brewfile from #{brewfile_url}"
    end

    ohai "Installing from downloaded Brewfile..."
    system "brew", "bundle", "install", "--file=#{buildpath}/Brewfile.downloaded"

    # Record installation
    (buildpath/"cj.installed").write(Time.now.to_s)
    prefix.install "cj.installed"
  end

  test do
    assert_predicate prefix/"cj.installed", :exist?, "Install marker missing"
  end
end
