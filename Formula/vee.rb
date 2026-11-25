class Vee < Formula
  desc "Local-first AI code review gate for teams and coding agents"
  homepage "https://github.com/klarlabs-studio/vee"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/klarlabs-studio/vee/releases/download/v0.1.0/vee-aarch64-apple-darwin.tar.xz"
      sha256 "00f4fe30e9368b4ab6f00cc237c7970994148fbae8e2a3813499fc09166e770a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/klarlabs-studio/vee/releases/download/v0.1.0/vee-x86_64-apple-darwin.tar.xz"
      sha256 "bef3faeed56a39361520246c7922ba1b9a58dbd93073fcb69e817232ffdba741"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/klarlabs-studio/vee/releases/download/v0.1.0/vee-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "312fb305be0c1704cbe420cef3f5114a4cd0465b87211e505698572fe7146885"
    end
    if Hardware::CPU.intel?
      url "https://github.com/klarlabs-studio/vee/releases/download/v0.1.0/vee-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3ab4fa71e10995c9ca1231d2b2cefcc5fa0b89e0e688567b01e7927420e4e76e"
    end
  end
  license "MIT"

  def install
    bin.install "vee"
  end

  test do
    assert_match "vee #{version}", shell_output("#{bin}/vee --version")
  end
end
