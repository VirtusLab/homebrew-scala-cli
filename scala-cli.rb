# typed: false
# frozen_string_literal: true

# ScalaCli Formula
class ScalaCli < Formula
  desc "Launcher for ScalaCli"
  homepage "https://virtuslab.github.io/scala-cli/"
  url "https://github.com/Virtuslab/scala-cli/releases/download/v0.0.7/scala-cli-x86_64-apple-darwin.gz"
  version "0.0.7"
  sha256 "ee1915c18efe0a92164b732710baa7a6f44ace768cf854d45dfbe71f78a5db6c"
  license "Apache-2.0"
  bottle :unneeded

  depends_on java: "1.8+" if MacOS.version < :catalina
  depends_on "openjdk" if MacOS.version >= :catalina

  def install
    bin.install "scala-cli-x86_64-apple-darwin" => "scala-cli"
  end

  test do
    (testpath / "Hello.scala").write "object Hello {
                                def main(args: Array[String]): Unit =
                                  println(\"Hello from Scala\")
                              }"
    output = shell_output("#{bin}/scala-cli Hello.scala")
    assert_equal ["Hello from Scala\n"], output.lines
  end
end
