# frozen_string_literal: true

class C4j < Formula
  desc "Installer for 0xC4J's development environment using a Brewfile"
  homepage "https://github.com/0xC4J/homebrew-0xc4j"
  
  url "https://github.com/0xC4J/homebrew-0xc4j/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "5db7298fbce6431e064ebe59443443530f9e6a961f64ae44eb68421f5be784eb"
  
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
