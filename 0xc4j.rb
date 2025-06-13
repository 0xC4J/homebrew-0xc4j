# frozen_string_literal: true

class C4j < Formula
  desc "Installer for 0xC4J's development environment using a Brewfile"
  homepage "https://github.com/0xC4J/homebrew-0xc4j"
  
  # เราต้องมี URL และ sha256 เพื่อให้ Homebrew ทำงานได้
  # คุณจะต้องสร้าง Release ใหม่ (เช่น v2.0.0) แล้วคำนวณค่า sha256 ใหม่นะครับ
  url "https://github.com/0xC4J/homebrew-0xc4j/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "YOUR_NEW_SHA256_HASH_FOR_V2_GOES_HERE" # <== แก้ไขค่านี้
  
  license "MIT"

  # ระบุว่า Formula นี้ต้องใช้ `brew bundle` ซึ่งมาจาก `homebrew/bundle`
  # Homebrew จะติดตั้งให้โดยอัตโนมัติหากยังไม่มี
  depends_on "homebrew/bundle"

  def install
    # ที่อยู่ไฟล์ Brewfile ของคุณบน GitHub
    brewfile_url = "https://raw.githubusercontent.com/0xC4J/homebrew-0xc4j/main/Brewfile"
    
    # แสดงข้อความใน Terminal ให้ผู้ใช้รู้ว่ากำลังทำอะไร
    ohai "Downloading Brewfile from your GitHub..."
    
    # ดาวน์โหลด Brewfile มาไว้ในเครื่องชั่วคราว
    # และใช้ `system` เพื่อรันคำสั่ง `brew bundle install`
    system "brew", "bundle", "install", "--file=#{brewfile_url}"

    # สร้างไฟล์ว่างๆ เพื่อให้ Homebrew รู้ว่าการติดตั้ง "0xc4j" สำเร็จแล้ว
    prefix.install "Brewfile.installed"
  end

  test do
    # การทดสอบง่ายๆ คือเช็คว่าไฟล์ที่เราสร้างในขั้นตอน install นั้นมีอยู่จริง
    assert_predicate prefix/"Brewfile.installed", :exist?
  end
end
