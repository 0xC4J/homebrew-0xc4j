# frozen_string_literal: true

class Cj < Formula
  desc "Installer for cj's development environment"
  homepage "https://github.com/0xC4J/homebrew-0xc4j"

  url "https://github.com/0xC4J/homebrew-0xc4j/archive/refs/tags/v4.0.0.tar.gz"
  sha256 "2c7d2b90da87794a2e59d7fe4fce4efe1c12d07063d84d51bff87c875dc491fe"
  
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
