# frozen_string_literal: true

class Cj < Formula
  desc "Installer for cj's development environment"
  homepage "https://github.com/0xC4J/homebrew-0xc4j"

  url "https://github.com/0xC4J/homebrew-0xc4j/archive/refs/tags/v4.0.0.tar.gz"
  sha256 "9e7043aa870540ea49f7c776dbd1e8f87b44ad33d8c2d4e6c3f78044f79de9d6"
  
  license "MIT"

  depends_on "homebrew/bundle"

  def install
    brewfile_url = "https://raw.githubusercontent.com/0xC4J/homebrew-0xc4j/main/Brewfile"
    
    ohai "Downloading Brewfile from your GitHub..."

    system "brew", "bundle", "install", "--file=#{brewfile_url}"

    prefix.install "Brewfile.installed"
  end

  test do
    assert_predicate prefix/"Brewfile.installed", :exist?
  end
end
