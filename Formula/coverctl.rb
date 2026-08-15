# Homebrew formula for Coverctl
# To install: brew tap klarlabs-studio/tap && brew install coverctl
class Coverctl < Formula
  desc "Declarative, domain-aware coverage enforcement for any language"
  homepage "https://github.com/klarlabs-studio/coverctl"
  version "1.20.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/klarlabs-studio/coverctl/releases/download/v#{version}/coverctl-darwin-arm64.tar.gz"
      sha256 "6b5c146a15a697b5a5cab84f58b0e783de82878365eb8abfff624bb733b4e54e"

      def install
        bin.install "coverctl-darwin-arm64" => "coverctl"
      end
    else
      url "https://github.com/klarlabs-studio/coverctl/releases/download/v#{version}/coverctl-darwin-amd64.tar.gz"
      sha256 "c1a2869eba57a59dfecb2ff5e80fc159fc9541c62936efe3cd09e1d13cb9c8c4"

      def install
        bin.install "coverctl-darwin-amd64" => "coverctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/klarlabs-studio/coverctl/releases/download/v#{version}/coverctl-linux-arm64.tar.gz"
      sha256 "ba0c3ab6c580c8f477e9cf6e0cabb80f7bd56cb63e7f86ae008921cdcbc9e951"

      def install
        bin.install "coverctl-linux-arm64" => "coverctl"
      end
    else
      url "https://github.com/klarlabs-studio/coverctl/releases/download/v#{version}/coverctl-linux-amd64.tar.gz"
      sha256 "256b62308a4b67730dd68a24a5c8bd552d815db21267e1ba78e912272000f5f7"

      def install
        bin.install "coverctl-linux-amd64" => "coverctl"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coverctl --version")
  end
end
