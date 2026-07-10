# Homebrew formula for Coverctl
# To install: brew tap klarlabs-studio/tap && brew install coverctl
class Coverctl < Formula
  desc "Declarative, domain-aware coverage enforcement for any language"
  homepage "https://github.com/klarlabs-studio/coverctl"
  version "1.19.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/klarlabs-studio/coverctl/releases/download/v#{version}/coverctl-darwin-arm64.tar.gz"
      sha256 "703ed0c31a54366a72a8e6b371e225ffa7297f57f4dce9865cf78799e39ffeee"

      def install
        bin.install "coverctl-darwin-arm64" => "coverctl"
      end
    else
      url "https://github.com/klarlabs-studio/coverctl/releases/download/v#{version}/coverctl-darwin-amd64.tar.gz"
      sha256 "e58d017c6e1c2ac9b55c4d8950352519af8ccaed943aa58a37f3deaafd11328b"

      def install
        bin.install "coverctl-darwin-amd64" => "coverctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/klarlabs-studio/coverctl/releases/download/v#{version}/coverctl-linux-arm64.tar.gz"
      sha256 "46b25f88b6016d9efe6653be856017319da34de94da221fd3d0e48631613f6f1"

      def install
        bin.install "coverctl-linux-arm64" => "coverctl"
      end
    else
      url "https://github.com/klarlabs-studio/coverctl/releases/download/v#{version}/coverctl-linux-amd64.tar.gz"
      sha256 "94ecb14809b8c00652316b9e1d69a8b7a192b7fe150f8a1c6077d3853398b8de"

      def install
        bin.install "coverctl-linux-amd64" => "coverctl"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coverctl --version")
  end
end
