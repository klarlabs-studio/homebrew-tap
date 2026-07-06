# Homebrew formula for Coverctl
# To install: brew tap klarlabs-studio/tap && brew install coverctl
class Coverctl < Formula
  desc "Declarative, domain-aware coverage enforcement for any language"
  homepage "https://github.com/klarlabs-studio/coverctl"
  version "1.18.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/klarlabs-studio/coverctl/releases/download/v#{version}/coverctl-darwin-arm64.tar.gz"
      sha256 "a524b2de4f0d26700e13e6cb04dffa10a9bfe7f4f3f66a8cb7e8e87c1abf0b95"

      def install
        bin.install "coverctl-darwin-arm64" => "coverctl"
      end
    else
      url "https://github.com/klarlabs-studio/coverctl/releases/download/v#{version}/coverctl-darwin-amd64.tar.gz"
      sha256 "7cc05cc728437b1b5f616b710beab184963ada91102f371f08a44637e7c373ce"

      def install
        bin.install "coverctl-darwin-amd64" => "coverctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/klarlabs-studio/coverctl/releases/download/v#{version}/coverctl-linux-arm64.tar.gz"
      sha256 "85742594e11ac3c121d0bac2f9c073453e6322ed528b963921a17b3bd85853ce"

      def install
        bin.install "coverctl-linux-arm64" => "coverctl"
      end
    else
      url "https://github.com/klarlabs-studio/coverctl/releases/download/v#{version}/coverctl-linux-amd64.tar.gz"
      sha256 "491147a71da5b89c1372e643396530ab6541b9ea5af5e09c0f25d762b4d2f61a"

      def install
        bin.install "coverctl-linux-amd64" => "coverctl"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coverctl --version")
  end
end
