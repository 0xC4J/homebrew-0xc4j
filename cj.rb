# frozen_string_literal: true

class Cj < Formula
  desc "Installer for cj's development environment using a Brewfile"
  homepage "https://github.com/0xC4J/homebrew-0xc4j"

  url "https://github.com/0xC4J/homebrew-0xc4j/archive/refs/tags/v9.0.0.tar.gz"
  sha256 "ffd4bb5bb9d366c9c1e1fec9f5272c1112ced1aa312385efdd67679b4df23e8f"

  license "MIT"

  def install
    brewfile_url = "https://raw.githubusercontent.com/0xC4J/homebrew-0xc4j/main/Brewfile"
    
    ohai "Downloading Brewfile from your GitHub..."
    system "curl", "-fsSL", "-o", "Brewfile.downloaded", brewfile_url
    
    unless File.exist?("Brewfile.downloaded") && !File.zero?("Brewfile.downloaded")
      odie "Failed to download Brewfile or the file is empty. Please check the URL: #{brewfile_url}"
    end

    brew_executable = "#{HOMEBREW_PREFIX}/bin/brew"
    
    ohai "Installing from Brewfile using #{brew_executable}..."
    
    system brew_executable, "bundle", "install", "--file=Brewfile.downloaded", "--verbose"

    touch "cj.installed"
    prefix.install "cj.installed"
  end

  test do
    assert_predicate prefix/"cj.installed", :exist?
  end
end
