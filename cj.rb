# frozen_string_literal: true

class Cj < Formula
  desc "Installer for cj's development environment using a Brewfile"
  homepage "https://github.com/0xC4J/homebrew-0xc4j"

  url "https://github.com/0xC4J/homebrew-0xc4j/archive/refs/tags/v7.0.0.tar.gz"
  sha256 "YOUR_VERY_FINAL_SHA256_HASH_HERE"

  license "MIT"

  def install
    brewfile_url = "https://raw.githubusercontent.com/0xC4J/homebrew-0xc4j/main/Brewfile"
    
    ohai "Downloading Brewfile from your GitHub..."
    system "curl", "-fsSL", "-o", "Brewfile.downloaded", brewfile_url
    
    unless File.exist?("Brewfile.downloaded")
      odie "Failed to download Brewfile from #{brewfile_url}"
    end

    ohai "Installing from downloaded Brewfile..."
    system "brew", "bundle", "install", "--file=Brewfile.downloaded"

    touch "cj.installed"
    prefix.install "cj.installed"
  end

  test do
    assert_predicate prefix/"cj.installed", :exist?
  end
end
