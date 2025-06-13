# frozen_string_literal: true

class Cj < Formula
  desc "Installer for cj's development environment"
  homepage "https://github.com/0xC4J/homebrew-0xc4j"

  url "https://github.com/0xC4J/homebrew-0xc4j/archive/refs/tags/v5.0.0.tar.gz"
  sha256 "2ed46975de598c33d3d6a8625849fccc4d2e046bf48910a45faef5b83c8cf418"

  license "MIT"

  def install
    brewfile_url = "https://raw.githubusercontent.com/0xC4J/homebrew-0xc4j/main/Brewfile"
    
    ohai "Downloading Brewfile from your GitHub..."

    system "brew", "bundle", "install", "--file=#{brewfile_url}"

    touch "cj.installed"
    prefix.install "cj.installed"
  end

  test do
    assert_predicate prefix/"cj.installed", :exist?
  end
end
